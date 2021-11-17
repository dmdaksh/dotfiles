if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif


call plug#begin()

" colorscheme
Plug 'tomasr/molokai'
" auto closing parenthesis
Plug 'cohama/lexima.vim'

if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
endif


call plug#end()



