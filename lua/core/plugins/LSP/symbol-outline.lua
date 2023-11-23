return {
    'simrat39/symbols-outline.nvim',
    enabled = require('core.enable_plugins').symbols_outline,
    event = 'LspAttach',
    config = function()
        require('symbols-outline').setup()
    end,
}
