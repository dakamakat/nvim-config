return {
    'Eandrju/cellular-automaton.nvim',
    config = function()
        vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
        vim.keymap.set("n", "<leader>fmg", "<cmd>CellularAutomaton game_of_life<CR>")
    end
}
