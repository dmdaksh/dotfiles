# dotfiles
dotfiles

## Setup process

- Update and Upgrade system (sudo apt update && sudo apt upgrade -y)
- Python to Python3 (sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1)
- Install required python packages (pip install torch torchvision numpy pandas scipy sklearn)
- Install NVM
  - Install Node using NVM (nvm install --lts)
    - Install pyright, tsserver (npm i -g pyright typescript typescript-language-server)
    - Update npm (npm i -g npm@latest)
- Install go (follow golang website instruction)
- Install neovim nightly, vim-plug and open plug.vim and install plugins
- For solarized theme, get the correct dircolors from dircolorsdb and update .dir_colors and .bashrc accordingly.
- Add CaskaydiaCode font (Install from nerd fonts) to apply webdevicons plugin
