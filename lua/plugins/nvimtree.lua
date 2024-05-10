return {

    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        -- pass to setup along with your other options
        require("nvim-tree").setup {
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
            view = {
                side = "right",
            },
            --     on_attach = my_on_attach,
            renderer = {
                highlight_git = true,
                group_empty = true,
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
    end
}
