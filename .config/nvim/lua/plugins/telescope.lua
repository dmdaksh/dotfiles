return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader> ",
      function()
        require("telescope.builtin").find_files({ hidden = false, no_ignore = false })
      end,
      desc = "Find files (excluding hidden and gitignored)",
    },
  },
}
