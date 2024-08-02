return {                    -- This plugin
    "Zeioth/compiler.nvim",
    "stevearc/overseer.nvim", --nvim job runner
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {
        task_list = {
            direction = "bottom",
            min_height = 25,
            max_height = 25,
            default_detail = 1
        },
    },
    config = function()
        require("donut").setup({
            timeout = 180, -- set to 0 to disable (can still be triggered manually with :Donut command)
            sync_donuts = false,
        })
    end
}
