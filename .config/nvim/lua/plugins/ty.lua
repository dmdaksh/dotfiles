local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

-- 1) Register ty as a custom LSP if it doesn’t exist in nvim-lspconfig yet
if not configs.ty then
  configs.ty = {
    default_config = {
      cmd = { "ty", "lsp" },
      filetypes = { "python" },
      root_dir = function(fname)
        return util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", ".git")(fname) or vim.fs.dirname(fname)
      end,
      settings = {},
    },
  }
end

-- 2) Configure LazyVim to enable ty and disable pyright
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure servers table exists
      opts.servers = opts.servers or {}

      -- Enable ty
      opts.servers.ty = opts.servers.ty or {}
      opts.servers.ty.enabled = true

      -- Disable Pyright to avoid overlapping diagnostics
      opts.servers.pyright = opts.servers.pyright or {}
      opts.servers.pyright.enabled = false
    end,
  },
}
