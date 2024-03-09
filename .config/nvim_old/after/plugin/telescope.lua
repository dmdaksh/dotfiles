require('telescope').setup {defaults = {file_ignore_patterns = {'^.git'}}}

-- Find files using Telescope command-line sugar.
local map = vim.api.nvim_set_keymap
default_opts = {noremap = true}

map('n', ';f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
    default_opts)
map('n', ';F',
    [[<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>]],
    default_opts)
map('n', ';r', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
    default_opts)
map('n', ';,', [[<cmd>lua require('telescope.builtin').buffers()<cr>]],
    default_opts)
map('n', ';;', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]],
    default_opts)

require("telescope").load_extension("ui-select")
