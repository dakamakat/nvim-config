return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                wrap_results = true,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    }
                }
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            }
        }

        require('telescope').load_extension('projects')

        require("project_nvim").setup {
            {
                -- Manual mode doesn't automatically change your root directory, so you have
                -- the option to manually do so using `:ProjectRoot` command.
                manual_mode = false,
                -- Methods of detecting the root directory. **"lsp"** uses the native neovim
                -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
                -- order matters: if one is not detected, the other is used as fallback. You
                -- can also delete or rearangne the detection methods.
                detection_methods = { "lsp", "pattern" },
                -- All the patterns used to detect root dir, when **"pattern"** is in
                -- detection_methods
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
                -- Table of lsp clients to ignore by name
                -- eg: { "efm", ... }
                ignore_lsp = {},
                -- Don't calculate root dir on specific directories
                -- Ex: { "~/.cargo/*", ... }
                exclude_dirs = {},
                -- Show hidden files in telescope
                show_hidden = false,
                -- When set to false, you will get a message when project.nvim changes your
                -- directory.
                silent_chdir = true,
                -- What scope to change the directory, valid options are
                -- * global (default)
                -- * tab
                -- * win
                scope_chdir = 'global',
                -- Path where project.nvim will store the project history for use in
                -- telescope
                datapath = vim.fn.stdpath("data"),
            }
        }

        local builtin = require('telescope.builtin')

        -- default keybindings
        vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[Find] [F]iles' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

        ----open project switcher
        vim.keymap.set('n', '<C-p>', require 'telescope'.extensions.projects.projects)

        --  custom keybindings
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end
}
