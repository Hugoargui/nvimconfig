return {
    'mfussenegger/nvim-dap',
    enabled = require('core.enable_plugins').dap,
    dependencies = {
        -- PERF: this plugin is very slow to load >500ms and significantly slows down neovim startup
        -- I don't realy need it unless I'm installing new DAP adapters, so just enable it on demand.
        -- 'jay-babu/mason-nvim-dap.nvim',

        'jbyuki/one-small-step-for-vimkind',
        'mfussenegger/nvim-dap-python',
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
        dap.adapters.nlua = function(callback, config)
            callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
        end

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
        dap.configurations.lua = {
            {
                type = 'nlua',
                request = 'attach',
                name = 'Attach to running Neovim instance',
            },
        }

        -- DEBUG ICONS AND HIGHLIGHTS'
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#993939' })

        vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = '#31353f' })
        vim.fn.sign_define(
            'DapLogPoint',
            { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' }
        )

        vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379', bg = '#31353f' })
        vim.fn.sign_define(
            'DapStopped',
            { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' }
        )

        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
        vim.fn.sign_define(
            'DapBreakpointCondition',
            { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' }
        )
        vim.fn.sign_define(
            'DapBreakpointRejected',
            { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
        )

        require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

        require('core.plugins.debugger.debug_mappings')
    end,
}
