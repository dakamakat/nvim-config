require('telescope').load_extension('projects')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

-- default keybindings
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[Find] [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

--open project switcher
vim.api.nvim_set_keymap(
        'n',
        '<C-p>',
        ":lua require'telescope'.extensions.projects.projects{}<CR>",
        {noremap = true, silent = true}
)
-- custom keybindings
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
