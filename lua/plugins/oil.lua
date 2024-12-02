return
{
  'stevearc/oil.nvim',
        config = function()
            require("oil").setup();
            vim.api.nvim_set_keymap('n', '<leader>fv', '<CMD>Oil<CR>', { noremap = true, silent = true })
        end,
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" }
}
