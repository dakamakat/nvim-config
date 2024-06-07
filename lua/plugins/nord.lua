return {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
        require('lualine').setup {
            options = {
                theme = 'nord'
            }
        }

        -- Example config in lua
        vim.g.nord_contrast = true
        vim.g.nord_disable_background = true
        -- vim.g.nord_borders = false
        -- vim.g.nord_italic = false
        -- vim.g.nord_uniform_diff_background = true
        -- vim.g.nord_bold = false

        -- Load the colorscheme
        require('nord').set()
    end
}
