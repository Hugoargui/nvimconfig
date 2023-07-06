return {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    keys = { '<lader>du' },
    config = function()
        require('dapui').setup()
    end,
}
