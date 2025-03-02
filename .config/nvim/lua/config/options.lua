-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.winbar = "%=%m %f"

-- word wrap
opt.wrap = true

-- set timeoutlen
opt.timeoutlen = 300
opt.ttimeoutlen = 10
