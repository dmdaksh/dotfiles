local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

return require('packer').startup(function()
    -- packer can manager itself
    use 'wbthomason/packer.nvim'

    -- autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

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
            'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim'
        }
    }

    -- colorscheme 
    -- use 'morhetz/gruvbox'
    -- use 'olimorris/onedarkpro.nvim'
    use 'EdenEast/nightfox.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- display startup time
    use 'dstein64/vim-startuptime'

    -- git plugin
    use 'tpope/vim-fugitive'

    -- git decorative plugin
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

end)
