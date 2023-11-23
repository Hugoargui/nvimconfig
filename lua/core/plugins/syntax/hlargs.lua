return {
    'm-demare/hlargs.nvim',
    enabled = require('core.enable_plugins').hlargs,
    event = 'LspAttach',

    options = function()
        require('hlargs').setup()
    end,
}
