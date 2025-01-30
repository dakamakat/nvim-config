return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
    config = function()
        require("catppuccin").setup({
            default_integrations = true,
            integrations = {
                mason = true,
                harpoon = true
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
    end
}
