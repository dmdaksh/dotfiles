-- load the Telescope builtins
local builtin = require("telescope.builtin")

-- define keybinding for finding files while ignoring hidden and gitignored files
vim.keymap.set("n", "<leader> ", function()
  builtin.find_files({ hidden = false, no_ignore = false })
end, { desc = "Find files (excluding hidden, gitignore)" })
