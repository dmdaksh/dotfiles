if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif


call plug#begin()

""""""""""""""""""""""""""""""""""""""
" colorscheme
" Plug 'tomasr/molokai'
" Plug 'altercation/vim-colors-solarized'
" Plug 'overcache/NeoSolarized'
" Plug 'morhetz/gruvbox'
" Plug 'projekt0n/github-nvim-theme'
" Using Vim-Plug:
Plug 'Mofiqul/dracula.nvim'

""""""""""""""""""""""""""""""""""""""
" auto closing parenthesis
"" Plug 'cohama/lexima.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind-nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'
    Plug 'kyazdani42/nvim-web-devicons'
endif


call plug#end()



