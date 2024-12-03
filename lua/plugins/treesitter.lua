return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "c_sharp", "rust", "lua", "javascript", "html" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>", -- set to `false` to disable one of the mappings
                    node_incremental = false,
                    scope_incremental = false,
                    node_decremental = false,
                },
            },
            autotag = {
                enable = true,
            },
        })
    end
}
