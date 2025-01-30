return {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    enabled = true,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
        require("everforest").load()
    end,
}
