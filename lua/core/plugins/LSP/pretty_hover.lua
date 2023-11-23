return {
    'Fildo7525/pretty_hover',
    enabled = require('core.enable_plugins').pretty_hover,
    event = 'LspAttach',
    config = function()
        require('pretty_hover').setup()
    end,
}
