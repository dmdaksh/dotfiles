-- checkout hidden, formatoptions, foldmethod, wrap, path, shortmess, \
-- laststatus, lazyredraw, inccommand, splitbelow, splitright, windignore, \
-- wildmenu, wildmode, wildoptions
local opt = vim.opt -- global/tab/buffer/window-scoped options
local cmd = vim.cmd -- execute vim command
local exec = vim.api.nvim_exec -- execute vimscript
local fn = vim.fn -- call vim functions
local g = vim.g -- global variables

opt.mouse = 'a' -- enabling mouse support in normal and visual mode
opt.completeopt = 'menu,menuone,noinsert' -- ins-completion supported value
opt.swapfile = false -- don't use swapfile

-- netrw setup
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_browse_split = 4
g.netrw_altv = 1
g.netrw_winsize = 20
-- uncomment this to get dir tree structure when editor is opened
-- cmd([[augroup ProjectDrawer
--   autocmd!
--   autocmd VimEnter * :Vexplore
-- augroup END]])

cmd([[command! MakeTags !ctags -R .]]) -- command to create tag file

opt.number = true -- set number
opt.relativenumber = true -- set relative number

opt.et = true -- set expandtab
opt.ts = 2 -- set tabstop=2
opt.sts = 2 -- set softtabstop=2
opt.sw = 2 -- set shiftwidth=2

opt.autoindent = true -- set autoindent
opt.smartindent = true -- set smartindent

opt.showmatch = true -- show matching (), [], {}

opt.cursorline = true -- show cursorline

opt.ignorecase = true -- set ignorecare 
opt.smartcase = true -- set smartcase

opt.undofile = true -- set undofile (undodir=~/.local/share/nvim/undo)

opt.signcolumn = 'yes' -- always show signcolumn

opt.colorcolumn = '120' -- set colorcolumn to 80 cols

opt.splitright = true -- split window right
opt.splitbelow = true -- split window below

opt.linebreak = true -- wrap line at word boundary

opt.path:append('**') -- search into subdirs

opt.lazyredraw = true -- buffer screen updates (lazy redraw)
opt.synmaxcol = 240 -- max col for syntax highlight

-- opt.termguicolors = true -- enable 24-bit RGB colors
cmd[[colorscheme gruvbox]]
