-- Neovim plugin for dimming the highlights of unused functions, variables, parameters, and more
return {
    'zbirenbaum/neodim',
    enabled = require('core.enable_plugins').neodim,
    event = 'LspAttach',
    config = function()
        require('neodim').setup({
            refresh_delay = 50,
            alpha = 0.5,
            blend_color = '#FF0000',
            -- blend_color = '#000000',
            hide = {
                underline = false,
                virtual_text = false,
                signs = false,
            },
            regex = {
                '[uU]nused',
                '[nN]ever [rR]ead',
                '[nN]ot [rR]ead',
            },
            priority = 128,
            disable = {},
        })
    end,
}
