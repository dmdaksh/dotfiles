#!/usr/bin/env bash

# Enable exit-on-error, error on undefined variables, and pipeline fail-fast
set -euo pipefail

# Ensure we run in a Bash shell (which supports arrays)
[ -n "${BASH_VERSION:-}" ] || exec bash "$0" "$@"


# Output formatting helpers
info() { printf '\033[1;34m[INFO]\033[0m %s\n' "$*"; }
success() { printf '\033[1;32m[SUCCESS]\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[WARN]\033[0m %s\n' "$*"; }
error() { printf '\033[1;31m[ERROR]\033[0m %s\n' "$*"; exit 1; }
dry_run_msg() { printf '\033[1;30m[DRY-RUN]\033[0m %s\n' "$*"; }

# Dotfiles repo path (assumed to be current working directory of script run)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Global dry run flag
DRY_RUN=false

# Parse flags
for arg in "$@"; do
    case "$arg" in
        --dry-run|-d)
            DRY_RUN=true
            info "Running in DRY RUN mode. No changes will be made to your system."
            ;;
    esac
done

# Helper function to conditionally run command or output dry-run info
run_cmd() {
    if [ "$DRY_RUN" = "true" ]; then
        dry_run_msg "Would execute: $*"
    else
        "$@"
    fi
}

# ----------------------------------------------------
# 1. OS DETECTION
# ----------------------------------------------------
OS="$(uname -s)"
info "Detecting Operating System... Found: $OS"

# ----------------------------------------------------
# 2. SYSTEM UTILITIES INSTALLATION
# ----------------------------------------------------
if [ "$OS" = "Darwin" ]; then
    # macOS SETUP
    if ! command -v brew &> /dev/null; then
        info "Homebrew not found. Installing Homebrew..."
        if [ "$DRY_RUN" = "true" ]; then
            dry_run_msg "Would run Homebrew installer script"
        else
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            if [ -f "/opt/homebrew/bin/brew" ]; then
                eval "$(/opt/homebrew/bin/brew shellenv)"
            elif [ -f "/usr/local/bin/brew" ]; then
                eval "$(/usr/local/bin/brew shellenv)"
            fi
        fi
    fi

    info "Installing macOS System Packages via Homebrew..."
    BREW_PACKAGES=(git tmux ripgrep fd lazygit gh go node)
    for pkg in "${BREW_PACKAGES[@]}"; do
        if ! command -v "$pkg" &> /dev/null && ! brew list --formula | grep -x "$pkg" &>/dev/null; then
            if [ "$DRY_RUN" = "true" ]; then
                dry_run_msg "Would install $pkg via Homebrew"
            else
                info "Installing $pkg..."
                brew install "$pkg"
            fi
        else
            info "$pkg is already installed."
        fi
    done

    # Font Setup for macOS
    info "Installing Nerd Fonts..."
    if [ "$DRY_RUN" = "true" ]; then
        dry_run_msg "Would install font-hack-nerd-font and font-caskaydia-cove-nerd-font casks via Homebrew"
    else
        # Resolve orphan Hack font files before cask install to avoid collisions
        if ! brew list --cask | grep -x "font-hack-nerd-font" &>/dev/null; then
            local orphan_fonts=(
                "$HOME/Library/Fonts/HackNerdFont-Bold.ttf"
                "$HOME/Library/Fonts/HackNerdFont-BoldItalic.ttf"
                "$HOME/Library/Fonts/HackNerdFont-Italic.ttf"
                "$HOME/Library/Fonts/HackNerdFont-Regular.ttf"
                "$HOME/Library/Fonts/HackNerdFontMono-Bold.ttf"
                "$HOME/Library/Fonts/HackNerdFontMono-BoldItalic.ttf"
                "$HOME/Library/Fonts/HackNerdFontMono-Italic.ttf"
                "$HOME/Library/Fonts/HackNerdFontMono-Regular.ttf"
                "$HOME/Library/Fonts/HackNerdFontPropo-Bold.ttf"
                "$HOME/Library/Fonts/HackNerdFontPropo-BoldItalic.ttf"
                "$HOME/Library/Fonts/HackNerdFontPropo-Italic.ttf"
                "$HOME/Library/Fonts/HackNerdFontPropo-Regular.ttf"
            )
            local found_orphans=false
            for f in "${orphan_fonts[@]}"; do
                if [ -f "$f" ]; then
                    found_orphans=true
                    break
                fi
            done
            if [ "$found_orphans" = "true" ]; then
                warn "Found conflicting manual Hack Nerd Font files. Cleaning them up to allow Homebrew install..."
                for f in "${orphan_fonts[@]}"; do
                    rm -f "$f"
                done
            fi
        fi

        brew install --cask font-hack-nerd-font || warn "Could not install Hack Nerd Font Cask"
        brew install --cask font-caskaydia-cove-nerd-font || warn "Could not install Caskaydia Cove Nerd Font Cask"
    fi

elif [ "$OS" = "Linux" ]; then
    # LINUX SETUP (Debian/Ubuntu targeted)
    if ! command -v apt-get &> /dev/null; then
        error "This script currently only supports Linux distributions utilizing APT (Ubuntu/Debian)."
    fi

    if [ "$DRY_RUN" = "true" ]; then
        dry_run_msg "Would run sudo apt-get update"
    else
        info "Updating system packages..."
        sudo apt-get update
    fi

    info "Installing Linux System Packages..."
    APT_PACKAGES=(git tmux ripgrep fd-find xclip clangd curl build-essential unzip)
    for pkg in "${APT_PACKAGES[@]}"; do
        if ! dpkg -l | grep " $pkg " &>/dev/null; then
            if [ "$DRY_RUN" = "true" ]; then
                dry_run_msg "Would install $pkg via APT"
            else
                info "Installing $pkg..."
                sudo apt-get install -y "$pkg"
            fi
        else
            info "$pkg is already installed."
        fi
    done

    # Install Lazygit on Linux (binary install, as APT repo often lacks it)
    if ! command -v lazygit &> /dev/null; then
        info "Installing Lazygit..."
        if [ "$DRY_RUN" = "true" ]; then
            dry_run_msg "Would download and install latest lazygit binary to /usr/local/bin"
        else
            LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
            curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
            tar xf lazygit.tar.gz lazygit
            sudo install lazygit /usr/local/bin
            rm lazygit lazygit.tar.gz
            success "Lazygit installed successfully."
        fi
    fi

    # Install GitHub CLI (gh) on Linux
    if ! command -v gh &> /dev/null; then
        info "Installing GitHub CLI..."
        if [ "$DRY_RUN" = "true" ]; then
            dry_run_msg "Would setup official GitHub CLI APT repository and install gh"
        else
            sudo mkdir -p -m 755 /etc/apt/keyrings
            wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
            sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/keyrings/githubcli-active.list > /dev/null
            sudo apt-get update
            sudo apt-get install -y gh
        fi
    fi

    # Install Node/NPM if missing (Linux)
    if ! command -v node &> /dev/null; then
        info "Node not found. Installing Node via NodeSource..."
        if [ "$DRY_RUN" = "true" ]; then
            dry_run_msg "Would add NodeSource repository and install nodejs"
        else
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            sudo apt-get install -y nodejs
        fi
    fi

    # Install Go if missing (Linux)
    if ! command -v go &> /dev/null; then
        info "Go not found. Installing Go..."
        if [ "$DRY_RUN" = "true" ]; then
            dry_run_msg "Would download Go tarball and install to /usr/local/go"
        else
            GO_TAR="go1.22.2.linux-amd64.tar.gz" # Safe fallback version
            wget -q "https://go.dev/dl/$GO_TAR"
            sudo rm -rf /usr/local/go
            sudo tar -C /usr/local -xzf "$GO_TAR"
            rm "$GO_TAR"
            export PATH="/usr/local/go/bin:$PATH"
        fi
    fi

    # Font Setup for Linux
    info "Installing Nerd Fonts..."
    if [ "$DRY_RUN" = "true" ]; then
        dry_run_msg "Would download and extract Hack and Cascadia Nerd Fonts to ~/.local/share/fonts"
    else
        mkdir -p "$HOME/.local/share/fonts"
        # Hack Font
        wget -qO hack.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
        unzip -o hack.zip -d "$HOME/.local/share/fonts"
        rm hack.zip
        # Cascadia (CaskaydiaCove)
        wget -qO cascadia.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
        unzip -o cascadia.zip -d "$HOME/.local/share/fonts"
        rm cascadia.zip
        fc-cache -fv
    fi
fi

# ----------------------------------------------------
# 3. PYTHON SETUP (uv)
# ----------------------------------------------------
info "Bootstrapping Python via uv..."
if ! command -v uv &> /dev/null; then
    info "Installing uv..."
    if [ "$DRY_RUN" = "true" ]; then
        dry_run_msg "Would download and run uv standalone installer"
    else
        curl -LsSf https://astral.sh/uv/install.sh | sh
        export PATH="$HOME/.local/bin:$PATH"
    fi
else
    info "uv is already installed."
fi

# Install Python global tools via uv
info "Installing Python global tools..."
PYTHON_TOOLS=(ty pyrefly ruff black jupyterlab)
for tool in "${PYTHON_TOOLS[@]}"; do
    # Check if tool is already installed (skipped in dry-run since list might change)
    if [ "$DRY_RUN" = "true" ]; then
        dry_run_msg "Would check and install $tool globally via uv tool install"
    elif ! uv tool list | grep "^$tool " &>/dev/null; then
        info "Installing $tool..."
        uv tool install "$tool"
    else
        info "$tool is already installed via uv."
    fi
done

# ----------------------------------------------------
# 4. GLOBAL NODE PACKAGES
# ----------------------------------------------------
info "Installing global Node packages..."
if [ "$DRY_RUN" = "true" ]; then
    dry_run_msg "Would run: npm install -g typescript typescript-language-server tree-sitter-cli neovim"
else
    if command -v npm &> /dev/null; then
        npm install -g typescript typescript-language-server tree-sitter-cli neovim || warn "NPM global installs failed. Check write permissions."
    else
        warn "NPM is not installed. Skipping TypeScript LSPs."
    fi
fi

# ----------------------------------------------------
# 5. SYMLINK CREATION (tmux, vimrc, nvim)
# ----------------------------------------------------
info "Configuring Symlinks..."

# Helper function to link files cleanly with backups
link_file() {
    local src="$1"
    local dest="$2"

    # Verify source file exists (skipped check in dry-run to keep it clean)
    if [ "$DRY_RUN" = "false" ] && [ ! -e "$src" ]; then
        warn "Source path does not exist: $src. Skipping link."
        return
    fi

    # Check if destination already exists
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        # If it's a symlink pointing to the exact source, we're done
        if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
            info "Link already exists: $dest -> $src"
            return
        fi

        local backup="${dest}.bak"
        if [ "$DRY_RUN" = "true" ]; then
            dry_run_msg "Would backup existing config at $dest to $backup"
        else
            warn "Backing up existing config at $dest to $backup"
            rm -rf "$backup"
            mv "$dest" "$backup"
        fi
    fi

    # Link the file
    if [ "$DRY_RUN" = "true" ]; then
        success "[DRY-RUN] Would create link: $dest -> $src"
    else
        mkdir -p "$(dirname "$dest")"
        ln -sf "$src" "$dest"
        success "Linked: $dest -> $src"
    fi
}

# Apply symlinks
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

if [ "$DRY_RUN" = "true" ]; then
    success "Dry run complete! Checked OS packages, LSPs, global tools, and links."
else
    success "Bootstrap complete! Please open a new terminal window or source ~/.zshrc."
fi
