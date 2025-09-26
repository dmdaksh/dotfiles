-- base kanagawa theme
return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
}

-- -- base rose-pine theme
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine")
--   end,
-- }

-- -- custom rose-pine theme
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     -- make sure terminal colors are enabled
--     vim.opt.termguicolors = true
--
--     local rp = require("rose-pine")
--     local cfg = require("rose-pine.config")
--
--     rp.setup({
--       -- core defaults (satisfy the LSP)
--       variant = cfg.variant,
--       dark_variant = cfg.dark_variant,
--       dim_inactive_windows = cfg.dim_inactive_windows,
--       extend_background_behind_borders = cfg.extend_background_behind_borders,
--       enable = cfg.enable,
--       styles = cfg.styles,
--       palette = cfg.palette,
--       groups = cfg.groups,
--       before_highlight = cfg.before_highlight,
--
--       -- my overrides
--       disable_background = true,
--       disable_float_background = true,
--       highlight_groups = {
--         Normal = { bg = "none" },
--         NormalFloat = { bg = "none" },
--         Folded = { bg = "none" },
--         SignColumn = { bg = "none" },
--         EndOfBuffer = { bg = "none" },
--       },
--     })
--
--     vim.cmd("colorscheme rose-pine")
--   end,
-- }

-- return {
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     opts = {
--       term_colors = true,
--       transparent_background = false,
--       styles = {
--         comments = {},
--         conditionals = {},
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--       },
--       color_overrides = {
--         mocha = {
--           base = "#000000",
--           mantle = "#000000",
--           crust = "#000000",
--         },
--       },
--       integrations = {
--         telescope = {
--           enabled = true,
--           style = "nvchad",
--         },
--         dropbar = {
--           enabled = true,
--           color_mode = true,
--         },
--       },
--     },
--   },
-- }
