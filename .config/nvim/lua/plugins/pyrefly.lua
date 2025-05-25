local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

-- 1) Register Pyrefly as a custom LSP if it doesn’t exist yet
if not configs.pyrefly then
  configs.pyrefly = {
    default_config = {
      cmd = { "pyrefly", "lsp" },
      filetypes = { "python" },
      root_dir = function(fname)
        return util.root_pattern("pyrefly.toml", "pyproject.toml", ".git")(fname) or vim.fs.dirname(fname)
      end,
      settings = {},
    },
  }
end

-- 2) Tell LazyVim to enable Pyrefly (and disable Pyright), but
--    don’t override `setup` so that LazyVim’s default on_attach &
--    capabilities (which power `gd`/hover/completion) are applied.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyrefly = {}, -- presence here is enough; LazyVim will auto-setup it
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- explicitly enable Pyrefly
      opts.servers.pyrefly = opts.servers.pyrefly or {}
      opts.servers.pyrefly.enabled = true
      -- -- disable Pyright now that we’re using Pyrefly
      -- opts.servers.pyright = opts.servers.pyright or {}
      -- opts.servers.pyright.enabled = false
    end,
  },
}
