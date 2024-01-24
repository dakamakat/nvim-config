return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter.configs")

        require 'nvim-treesitter.install'.compilers = { "clang" }

        ts.setup {
            ensure_installed = { "bicep",
                "javascript",
                "typescript",
                "c_sharp",
                "lua",
                "rust",
                "vim",
                "regex",
                "lua",
                "bash",
                "markdown",
                "markdown_inline" },

            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<cr>',
                    node_incremental = '<c-s>',
                    scope_incremental = '<c-s>',
                    node_decremental = '<bs>',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- you can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
            },
            autotag = {
                enable = true,
            },
        }
    end
}
