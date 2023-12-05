return {
    'SmiteshP/nvim-navbuddy',
    enabled = require('core.enable_plugins').navbuddy,
    dependencies = {
        'neovim/nvim-lspconfig',
        'SmiteshP/nvim-navic',
        'MunifTanjim/nui.nvim',
    },
    cmd = { 'Navbuddy' },
    config = function()
        local actions = require('nvim-navbuddy.actions')
        local navbuddy = require('nvim-navbuddy')
        navbuddy.setup({
            window = {
                border = 'double',
                size = '80%', -- Or table format example: { height = "40%", width = "100%"}
            },
            lsp = { auto_attach = true },
        })
    end,
}
