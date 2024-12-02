return {

  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/projects/*",
      "~/projects/quod/*",
      "~/projects/rwe/*",
      "~/.config/nvim",
    },
    picker = {
      type = "telescope", -- or "fzf-lua"
    }
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    vim.api.nvim_set_keymap('n', '<C-p>', ':NeovimProjectDiscover<CR>', { noremap = true, silent = true })
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker
    { "nvim-telescope/telescope.nvim"},
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
