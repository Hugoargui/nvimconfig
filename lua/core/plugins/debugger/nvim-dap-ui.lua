return {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    keys = { '<lader>du' },
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
    end,
}
