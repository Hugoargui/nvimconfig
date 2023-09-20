return {
    'Wansmer/symbol-usage.nvim',
    -- enabled = false,
    event = 'LspAttach',
    config = function()
        require('symbol-usage').setup({ vt_position = 'end_of_line' })
    end,
}
