return {
    'Wansmer/symbol-usage.nvim',
    enabled = require('core.enable_plugins').symbol_usage,
    event = 'LspAttach',
    config = function()
        require('symbol-usage').setup({ vt_position = 'end_of_line' })
    end,
}
