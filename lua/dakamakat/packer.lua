--This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Visual

    -- use { "ellisonleao/gruvbox.nvim" }

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })

    use "rebelot/kanagawa.nvim"

    -- use 'folke/tokyonight.nvim'

    -- use "Shatur/neovim-ayu"

    -- use 'shaunsingh/nord.nvim'

    -- use 'navarasu/onedark.nvim'

    use 'nvim-lualine/lualine.nvim'

    use 'xiyaowong/transparent.nvim'

    -- end of visual

    use {
        'nvim-tree/nvim-tree.lua',
        requires = { { 'nvim-tree/nvim-web-devicons' } }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use {
    --     "nvim-neotest/neotest",
    --     requires = {
    --         "rouge8/neotest-rust",
    --         "Issafalcon/neotest-dotnet",
    --         "nvim-lua/plenary.nvim",
    --         "antoinemadec/FixCursorHold.nvim"
    --     }
    -- }

    use "folke/trouble.nvim"

    use "tpope/vim-commentary"

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    use('ThePrimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'neovim/nvim-lspconfig' },             -- Required

            -- Autocompletion
            { "hrsh7th/cmp-buffer" },                  -- buffer completions
            { "hrsh7th/cmp-path" },                    -- path completions
            { "saadparwaiz1/cmp_luasnip" },            -- snippet completions
            { "hrsh7th/cmp-nvim-lua" },                -- lua vim completions
            { "hrsh7th/cmp-nvim-lsp-signature-help" }, -- function parameters completions

            { 'hrsh7th/nvim-cmp' },                    -- Required
            { 'hrsh7th/cmp-nvim-lsp' },                -- Required
            { 'L3MON4D3/LuaSnip' },                    -- Required

            { 'rafamadriz/friendly-snippets' },
        }
    }

    use 'simrat39/rust-tools.nvim'

    use { "rcarriga/nvim-dap-ui",
        requires = {
            { "mfussenegger/nvim-dap" },
            { "theHamsta/nvim-dap-virtual-text" }
        } }


    -- -- Project Switcher Config
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)
