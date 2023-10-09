local lsp = require('lsp-zero')

local lspconfig = require('lspconfig');

local cmp = require("cmp")

local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'csharp_ls',
        'tsserver',
        'eslint',
        'rust_analyzer' },
    handlers = {
        lsp.default_setup,
        csharp_ls = function()
            lspconfig.csharp_ls.setup({
                root_dir = function(startpath)
                    return lspconfig.util.root_pattern("*.sln")(startpath)
                        or lspconfig.util.root_pattern("*.csproj")(startpath)
                        or lspconfig.util.root_pattern("*.fsproj")(startpath)
                        or lspconfig.util.root_pattern(".git")(startpath)
                end,
            })
        end,
        lua_ls = function()
            lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        end
    }
})



lsp.setup()

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_cmp' },
        { name = 'luasnip',                keyword_length = 2 },
        { name = 'buffer',                 keyword_length = 3 },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    }
})

vim.diagnostic.config({
    virtual_text = true
})

--LSP Actions
--K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
--
--gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
--
--gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
--
--gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
--
--go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
--
--gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
--
--gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
--
--<F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
--
--<F3>: Format code in current buffer. See :help vim.lsp.buf.format().
--
--<F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
--
--gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
--
--[d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
--
--]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
--


require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap, dapui = require("dap"), require("dapui")
local mason_registry = require("mason-registry")

local netcoredbg = mason_registry.get_package("netcoredbg")
local netcoredbg_path = netcoredbg:get_install_path() .. "/netcoredbg"

dap.adapters.coreclr = {
    type = 'executable',
    command = netcoredbg_path,
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
    },
}

local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

dap.adapters.rust = {
  type = "server",
  port = "${port}",
  host = "127.0.0.1",
  executable = {
    command = codelldb_path,
    args = { "--liblldb", liblldb_path, "--port", "${port}" },
  },
}

dap.configurations.rust = {
  {
    name = "Rust debug",
    type = "rust",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F3>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
