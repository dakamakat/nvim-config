return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        'williamboman/mason.nvim', -- Optional
    },
    enabled = true,
    config = function()
        local dap, ui = require("dap"), require("dapui")
        local mason = require("mason")

        require("dapui").setup()
        require("dap-go").setup()
        require("nvim-dap-virtual-text").setup()

        mason.setup();

        local mason_registry = require("mason-registry")

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
        vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F6>", dap.step_into)
        vim.keymap.set("n", "<F7>", dap.step_over)
        vim.keymap.set("n", "<F8>", dap.step_out)
        vim.keymap.set("n", "<F9>", dap.step_back)
        vim.keymap.set("n", "<F12>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end

        vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
    end
}
