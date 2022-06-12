local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}
local cmd = vim.cmd

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- map Esc to jj
map('i', 'jj', '<Esc>', {noremap = true})

---- don't use arrow keys
--map('', '<up>', '<nop>', {noremap = true})
--map('', '<down>', '<nop>', {noremap = true})
--map('', '<left>', '<nop>', {noremap = true})
--map('', '<right>', '<nop>', {noremap = true})

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- -- move around splits using Ctrl + {h,j,k,l}
-- map('n', '<C-H>', '<C-w>h', default_opts)
-- map('n', '<C-J>', '<C-w>j', default_opts)
-- map('n', '<C-K>', '<C-w>k', default_opts)
-- map('n', '<C-L>', '<C-w>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':qa!<CR>', default_opts)

-- toggling fold
map('n', '<leader><space>', 'za', default_opts)

-- git & fugitive
-- map('n', '<leader>gs', ':G<CR>', default_opts)
-- map('n', '<leader>gh', ':diffget //2<CR>', default_opts)
-- map('n', '<leader>gl', ':diffget //3<CR>', default_opts)

-- Diffview
map('n', '<leader>go', ':DiffviewOpen<CR>', default_opts)
map('n', '<leader>gc', ':DiffviewClose<CR>', default_opts)
map('n', '<leader>fh', ':DiffviewFileHistory<CR>', default_opts)

-- Switch between tabs
map('n', '<leader>1', '1gt', default_opts)
map('n', '<leader>2', '2gt', default_opts)
map('n', '<leader>3', '3gt', default_opts)
map('n', '<leader>4', '4gt', default_opts)
map('n', '<leader>5', '5gt', default_opts)

-- nvim tree toggle
map('n', '<leader>nt', ':NvimTreeToggle<CR>', default_opts)

-- resize window
map('n', '<up>',    ':resize +2<CR>', default_opts)
map('n', '<down>',  ':resize -2<CR>', default_opts)
map('n', '<left>',  ':vertical resize +2<CR>', default_opts)
map('n', '<right>', ':vertical resize -2<CR>', default_opts)
