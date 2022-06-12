local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

return require('packer').startup(function()
  -- packer can manager itself
  use 'wbthomason/packer.nvim'

  -- autopairs
  use {'windwp/nvim-autopairs'}

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- statuslien
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip', 'onsails/lspkind-nvim'
    }
  }

  -- colorscheme 
  -- use 'morhetz/gruvbox'
  -- use 'olimorris/onedarkpro.nvim'
  -- use 'EdenEast/nightfox.nvim'
  use "rebelot/kanagawa.nvim"

  -- telescope
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}

  -- nvim tree
  use 'kyazdani42/nvim-tree.lua'

  -- display startup time
  use 'dstein64/vim-startuptime'

  -- show indentation
  use 'lukas-reineke/indent-blankline.nvim'

  -- git plugin
  -- use 'tpope/vim-fugitive'

  -- git decorative plugin
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- git diffview
  use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- markdown preview
  use {"davidgranstrom/nvim-markdown-preview"}

  -- rust tools
  use {'simrat39/rust-tools.nvim'}

  -- telescope ui select
  use {'nvim-telescope/telescope-ui-select.nvim'}

  -- dap
  use {'mfussenegger/nvim-dap'}

end)
