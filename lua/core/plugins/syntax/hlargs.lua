return {
    'm-demare/hlargs.nvim',
    enabled = false,
    event = 'LspAttach',

    options = function()
        require('hlargs').setup()
    end,
}
