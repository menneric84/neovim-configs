return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        require("dapui").setup()
        require("dap-go").setup()

        local dap, dapui = require("dap"), require("dapui")

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "/Users/rickymenne/Downloads/codelldb-x86_64-darwin/extension/adapter",
                args = { "--port", "${port}" },
            },
        }
        dap.configurations.rust = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("sudo /Users/rickymenne/.local/share/nvim/mason/bin", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
        vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
        vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
        vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
    end,
}
