return {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    enabled = false, -- todo this gives many errors since update

    opts = {}, -- Real options set during on attach
    config = function(_, opts)
        require('lsp_signature').setup(opts)
    end,
}
