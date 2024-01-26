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
            autotag = {
                enable = true,
            },
        }
    end
}
