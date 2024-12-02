return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        lazygit = {
        },
        dashboard = { enabled = true },
        bigfile = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        rename = { enabled = true },
    },
    keys = {
        { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>cR", function() Snacks.rename.rename_file() end,    desc = "Rename File" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end,      desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end,               desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end,           desc = "Lazygit Log (cwd)" },
        { "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
    },
}
