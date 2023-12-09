return {
    'rcarriga/nvim-dap-ui',
    enabled = require('core.enable_plugins').dap_ui,
    dependencies = { 'mfussenegger/nvim-dap' },
    keys = { '<leader>du' },
    config = function()
        require('dapui').setup({
            -- Comment out layouts to hide them
            layouts = {
                {
                    elements = {
                        {
                            id = 'scopes',
                            size = 0.5,
                        },
                        -- {
                        --     id = 'breakpoints',
                        --     size = 0.25,
                        -- },
                        {
                            id = 'stacks',
                            size = 0.25,
                        },
                        {
                            id = 'watches',
                            size = 0.25,
                        },
                    },
                    position = 'right',
                    size = 100,
                },
                {
                    elements = {
                        -- {
                        --     id = 'repl',
                        --     size = 0.5,
                        -- },
                        {
                            id = 'console',
                            size = 1.0,
                        },
                    },
                    position = 'bottom',
                    size = 10,
                },
            },
        })

        local dap = require('dap')
        dap.listeners.before.event_exited['dapui_config'] = function()
            require('dapui').close()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            require('dapui').close()
        end
    end,
}
