vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursordasda,sm:block-blinkwait175-blinkoff150-blinkon175"

--set netrw as the default file explorer
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 0
vim.g.netrw_winsize = 25



vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "95"

-- if vim.loop.os_uname().sysname == 'Windows_NT' then
--     -- Use Powershell Core, if not available Windows Powershell
--     if vim.fn.executable('pwsh') == 1 then
--         vim.opt.shell = 'pwsh'
--     else
--         vim.opt.shell = 'powershell'
--     end

--     vim.opt.shellcmdflag =
--     [[-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command
--     [Console]::InputEncoding=[Console]::OutputEncoding =
--     [System.Text.Encoding]::UTF8;]]
--     vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--     vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--     vim.opt.shellquote = ''
--     vim.opt.shellxquote = ''
-- end
