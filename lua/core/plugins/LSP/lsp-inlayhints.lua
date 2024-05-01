return {
    'lvimuser/lsp-inlayhints.nvim',
    enabled = require('core.enable_plugins').lsp_inlayhints,
    event = 'LspAttach',
    config = function()
        require('lsp-inlayhints').setup()
    end,
}
