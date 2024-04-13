return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter.configs")

        require 'nvim-treesitter.install'.compilers = { "clang" }

        ts.setup {
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "c_sharp",
                "sql",
                "yaml",
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
                    init_selection = "<CR>", -- set to `false` to disable one of the mappings
                    node_incremental = "false",
                    scope_incremental = "false",
                    node_decremental = "false",
                },
            },
            autotag = {
                enable = true,
            },
        }
    end
}
