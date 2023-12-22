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
                -- Manual mode doesn't automatically change your root directory, so you have
                -- the option to manually do so using `:ProjectRoot` command.
                manual_mode = false,

                -- Methods of detecting the root directory. **"lsp"** uses the native neovim
                -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
                -- order matters: if one is not detected, the other is used as fallback. You
                -- can also delete or rearangne the detection methods.
                detection_methods = { "lsp", "pattern" },

                -- All the patterns used to detect root dir, when **"pattern"** is in
                -- detection_methods
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

                -- Table of lsp clients to ignore by name
                -- eg: { "efm", ... }
                ignore_lsp = {},

                -- Don't calculate root dir on specific directories
                -- Ex: { "~/.cargo/*", ... }
                exclude_dirs = {},

                -- Show hidden files in telescope
                show_hidden = false,

                -- When set to false, you will get a message when project.nvim changes your
                -- directory.
                silent_chdir = true,

                -- What scope to change the directory, valid options are
                -- * global (default)
                -- * tab
                -- * win
                scope_chdir = 'global',

                -- Path where project.nvim will store the project history for use in
                -- telescope
                datapath = vim.fn.stdpath("data"), }
        end
    }

    --feel the sense
    use 'Eandrju/cellular-automaton.nvim'
end)
