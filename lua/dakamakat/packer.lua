--This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Visual

    -- use { "ellisonleao/gruvbox.nvim" }

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- use 'shaunsingh/nord.nvim'

    use 'navarasu/onedark.nvim'

    use 'nvim-lualine/lualine.nvim'

    use 'xiyaowong/transparent.nvim'

    -- end of visual

    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
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
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'L3MON4D3/LuaSnip' },         -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lsp' },     -- Optional
        }
    }
end)
