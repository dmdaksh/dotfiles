# dotfiles
dotfiles

## Setup process

- Update and Upgrade system (sudo apt update && sudo apt upgrade -y)
- Python to Python3 (sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1)
- Install python3-pip (sudo apt install python3-pip)
- Install required python packages (pip install torch torchvision numpy pandas matplotlib scipy sklearn neovim)
- Install NVM
  - Install Node using NVM (nvm install --lts)
    - Update npm (npm i -g npm@latest)
    - Install pyright, tsserver (npm i -g pyright typescript typescript-language-server tree-sitter-cli neovim)
- Install clangd, xclip, ripgrep, fd-find for neovim (sudo apt install clangd xclip ripgrep fd-find)
- Install go (follow golang website instruction)
- Install neovim nightly, vim-plug and open plug.vim and install plugins
- For cool shell prompt install starship (sh -c "$(curl -fsSL https://starship.rs/install.sh)")
- For solarized (using same dircolors for gruvbox too as it looks fine) theme, get the correct dircolors from dircolorsdb and update .dir_colors and .bashrc accordingly.
- Add CaskaydiaCode font (Install from nerd fonts) to apply webdevicons plugin
- Download fzf
