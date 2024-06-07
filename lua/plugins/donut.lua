return {
    "NStefan002/donut.nvim",
    version = "*",
    lazy = false,
    config = function()
        require("donut").setup({
            timeout = 180, -- set to 0 to disable (can still be triggered manually with :Donut command)
            sync_donuts = false,
        })
    end
}
