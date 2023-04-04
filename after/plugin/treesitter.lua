local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = { "html" , "javascript", "typescript", "c_sharp", "lua", "rust" },
    autotag = {
        enable = true,
    },
}
