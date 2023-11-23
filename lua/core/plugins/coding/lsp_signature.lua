return {
    'ray-x/lsp_signature.nvim',
    enabled = require('core.enable_plugins').lsp_signature,
    event = 'VeryLazy',

    opts = {}, -- Real options set during on attach
    config = function(_, opts)
        require('lsp_signature').setup(opts)
    end,
}
