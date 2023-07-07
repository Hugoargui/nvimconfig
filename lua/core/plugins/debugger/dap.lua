return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'jay-babu/mason-nvim-dap.nvim',
    },
    keys = { '<leader>d' },
    config = function()
        local dap = require('dap')
        dap.adapters.executable = {
            type = 'executable',
            command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
            name = 'lldb1',
            host = '127.0.0.1',
            port = 13000,
        }

        dap.adapters.lldb = {
            name = 'codelldb server',
            type = 'server',
            port = '${port}',
            executable = {
                command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
                args = { '--port', '${port}' },
            },
        }

        dap.configurations.cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description = 'enable pretty printing',
                        ignoreFailures = false,
                    },
                },
            },
        }
        dap.configurations.c = dap.configurations.cpp

        require('core.plugins.debugger.debug_mappings')
    end,
}
