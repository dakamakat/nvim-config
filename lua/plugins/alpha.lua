return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local startify = require 'alpha.themes.startify'

        -- Set menu
        startify.section.top_buttons.val = {
            startify.button("e", "New file", "<cmd>ene <CR>"),
            startify.button("f", "  > Find file", ":cd ~/ | Telescope find_files<CR>"),
            startify.button("p", "📚  > Open projects", ":Telescope projects<CR>"),
        }

        require 'alpha'.setup(startify.config)
    end
};
