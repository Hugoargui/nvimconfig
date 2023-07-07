return {
    'jay-babu/mason-nvim-dap.nvim',
    lazy = true,
    config = function()
        require('mason-nvim-dap').setup({
            ensure_installed = { 'codelldb' },
            automatic_setup = true,
            handlers = {}, -- sets up dap in the predefined manner
        })
    end,
}
