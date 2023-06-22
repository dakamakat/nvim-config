-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- local function my_on_attach(bufnr)
--     local api = require "nvim-tree.api"

--     local function opts(desc)
--         return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--     end

--     -- default mappings
--     api.config.mappings.default_on_attach(bufnr)
-- end

-- pass to setup along with your other options
require("nvim-tree").setup {

    --     on_attach = my_on_attach,

    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        root_folder_modifier = ":t",
        -- These icons are visible when you install web-devicons
        icons = {
            glyphs = {
                git = {
                    unstaged = "U",
                    staged = "S",
                    unmerged = "",
                    renamed = "R",
                    untracked = "UT",
                    deleted = "D",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "H",
            info = "",
            warning = "W",
            error = "E",
        },
    },
}

vim.keymap.set("n", "<leader>fv", ":NvimTreeToggle<CR>", { silent = true })
