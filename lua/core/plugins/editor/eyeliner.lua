return {
    'jinh0/eyeliner.nvim',
    enabled = require('core.enable_plugins').eyeliner,
    keys = { 'f', 'F', 't', 'T' },
    opts = {
        highlight_on_key = true, -- this must be set to true for dimming to work!
        dim = true,
    },
}
