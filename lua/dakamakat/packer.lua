--This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use { "wbthomason/packer.nvim", opt = true }

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
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry concatenates
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

    use('ThePrimeagen/vim-be-good')

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
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },                    -- completion plugin
            { "hrsh7th/cmp-buffer" },                  -- buffer completions
            { "hrsh7th/cmp-path" },                    -- path completions
            { "hrsh7th/cmp-cmdline" },                 -- cmdline completions
            { "saadparwaiz1/cmp_luasnip" },            -- snippet completions
            { "hrsh7th/cmp-nvim-lua" },                -- lua vim completions
            { "hrsh7th/cmp-nvim-lsp" },                -- LSP completions
            { "hrsh7th/cmp-nvim-lsp-signature-help" }, -- function parameters completions
            { 'L3MON4D3/LuaSnip' },                    -- Required
        }
    }
    -- Project Switcher Config
    use { "ahmedkhalf/project.nvim" }
end)
