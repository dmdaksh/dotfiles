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
" filetype plugin on
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

""""""""""""""""""""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
" setting colorscheme
" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined
" or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
" Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
" text output by commands like `ls` aren't what you expect, you might want to
" try disabling this option. Default value:
let g:neosolarized_termBoldAsBright = 1

let g:neosolarized_termtrans=1
colorscheme NeoSolarized
set termguicolors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require'nvim-web-devicons'.get_icons()
" adding support for airline devicons
let g:airline_powerline_fonts = 1
