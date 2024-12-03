return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Autocompletion
            "hrsh7th/cmp-cmdline",                 -- cmd line completions
            "hrsh7th/cmp-buffer",                  -- buffer completions
            "hrsh7th/cmp-path",                    -- path completions
            "hrsh7th/cmp-nvim-lua",                -- lua vim completions
            "hrsh7th/cmp-nvim-lsp-signature-help", -- function parameters completions

            'hrsh7th/cmp-nvim-lsp',                -- Required
            'L3MON4D3/LuaSnip',                    -- Required
        },
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

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
                    ['<TAB>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true
                    }),
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
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { noremap = true, silent = true, buffer = event.buf }

                    -- Helper function for key mappings
                    local function map(mode, lhs, rhs, options)
                        vim.keymap.set(mode, lhs, rhs, options)
                    end

                    map("n", "<space>e", vim.diagnostic.open_float, opts)

                    local builtin = require "telescope.builtin"

                    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

                    --Telescope builtins
                    map("n", "gd", builtin.lsp_definitions, opts)
                    map("n", "gr", builtin.lsp_references, opts)
                    map("n", "gD", vim.lsp.buf.declaration, opts)
                    map("n", "gT", vim.lsp.buf.type_definition, opts)
                    map("n", "K", vim.lsp.buf.hover, opts)

                    map("n", "<F2>", vim.lsp.buf.rename, opts)
                    map("n", "<F4>", vim.lsp.buf.code_action, opts)
                    map("n", "<space>wd", builtin.lsp_document_symbols, opts)
                    map('n', 'gi', vim.lsp.buf.implementation, opts)
                    map('n', 'gs', vim.lsp.buf.signature_help, opts)
                    map('n', '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
                end,
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })

            vim.diagnostic.config({
                underline = true,
                virtual_text = true,
                float = {
                    -- UI.
                    border = 'rounded',
                    focusable = true,
                }
            })
        end
    }
}
