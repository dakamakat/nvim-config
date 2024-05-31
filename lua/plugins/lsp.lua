return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        'williamboman/mason.nvim',           -- Optional
        'williamboman/mason-lspconfig.nvim', -- Optional
        'neovim/nvim-lspconfig',             -- Required

        -- Autocompletion
        "hrsh7th/cmp-cmdline",                 -- cmd line completions
        "hrsh7th/cmp-buffer",                  -- buffer completions
        "hrsh7th/cmp-path",                    -- path completions
        "saadparwaiz1/cmp_luasnip",            -- snippet completions
        "hrsh7th/cmp-nvim-lua",                -- lua vim completions
        "hrsh7th/cmp-nvim-lsp-signature-help", -- function parameters completions

        'hrsh7th/nvim-cmp',                    -- Required
        'hrsh7th/cmp-nvim-lsp',                -- Required
        'L3MON4D3/LuaSnip',                    -- Required

        'rafamadriz/friendly-snippets',
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        local lsp_config = require('lspconfig')

        --friendly snippets requirement
        require('luasnip.loaders.from_vscode').lazy_load()

        ---@diagnostic disable-next-line: unused-local
        lsp_zero.on_attach(function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'tsserver', 'rust_analyzer', 'gopls', 'yamlls', 'csharp_ls' },
            lsp_capabilities = lsp_capabilities,
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lsp_config.lua_ls.setup(lua_opts)
                end,
            }
        })

        local cmp = require('cmp')

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local cmp_action = require('lsp-zero').cmp_action()

        -- `/` cmdline setup.
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    { name = 'path', max_item_count = 5 },
                },
                {
                    {
                        name = 'cmdline',
                        max_item_count = 5,
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }),
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
            window = {
                completion = cmp.config.window.bordered(),

                documentation = cmp.config.window.bordered(),
            }
        })

        vim.diagnostic.config({
            underline = true,
            virtual_text = true,
            float = {
                -- UI.
                header = false,
                border = 'rounded',
                focusable = true,
            }
        })
    end
}

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
