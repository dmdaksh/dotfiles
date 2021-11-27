" setting encoding
set enc=utf-8
" Enable mouse usage
set mouse=a
" Turn on line numbers
set number
" Enable syntax highlighting
syntax on
" set tabs to have 4 spaces
set ts=2 sts=2
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=2
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all = 1
" no word wrap
"" set nowrap
" try to do best job to smart indent
set smartindent
" ignore case when using a search pattern
set ignorecase
" override 'ignorecase when pattern has upper case characters
set smartcase
" not use a swap file for this buffer
set noswapfile
" not keep a backup after overwriting a file
" set nobackup
" list of directories for undo files
" set undodir=~/.vim/undodir
" automatically save and restore undo history
" set undofile
" show match for partly typed search command
set incsearch
" show the relative line number for each line
set relativenumber	
" whether to show the signcolumn
set signcolumn=yes
" enable filetype detection
filetype plugin on
" setting scrolloff to 8
set scrolloff=10



" """"""""""""""""""""""""""""""""
" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


""""""""""""""""""""""""""""""""""


" Imports
runtime ./maps.vim
runtime ./plug.vim

" devicons and airline powerline
lua require'nvim-web-devicons'.get_icons()



" gruvbox themes
set termguicolors
colorscheme gruvbox
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

