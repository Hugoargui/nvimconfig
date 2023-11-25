-- PERF: this plugin is very slow to load >500ms and significantly slows down neovim startup
-- I don't realy need it unless I'm installing new DAP adapters, so just enable it on demand.
return {
    'jay-babu/mason-nvim-dap.nvim',
    enabled = require('core.enable_plugins').mason_dap,
    lazy = true,
    config = function()
        require('mason-nvim-dap').setup({
            ensure_installed = { 'codelldb' },
            automatic_setup = true,
            handlers = {}, -- sets up dap in the predefined manner
        })
    end,
}
