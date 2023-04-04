local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_sources = 'recommended'
  }
})

local cmp = require("cmp")

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
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

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
