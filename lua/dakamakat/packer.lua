--This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    -- Visual

    -- use { "ellisonleao/gruvbox.nvim" }

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })

    use 'folke/tokyonight.nvim'

    -- use "Shatur/neovim-ayu"

    -- use 'shaunsingh/nord.nvim'

    -- use 'navarasu/onedark.nvim'

    use 'nvim-lualine/lualine.nvim'

    use 'xiyaowong/transparent.nvim'

    -- end of visual

    use {
        'nvim-tree/nvim-tree.lua',
        -- requires = {
        --     'nvim-tree/nvim-web-devicons', -- optional
        -- },
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use "folke/trouble.nvim"

    use "tpope/vim-commentary"

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    use 'windwp/nvim-autopairs'

    use 'windwp/nvim-ts-autotag'

    use('nvim-lua/plenary.nvim')

    use('ThePrimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim'
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

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

    -- Project Switcher Config
    use { "ahmedkhalf/project.nvim" }
end)
