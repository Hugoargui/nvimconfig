-- Small Neovim plugin that provides keymaps for putting certain characters (or strings)
-- at the end of the current line (but before the comment if the line has one) without moving your cursor.
return {
    enabled = false, -- would love this plugin, but can't clone it
    'rareitems/put_at_end',
    keys = {
        {
            '<C-;>',
            function()
                require('put_at_end').put_semicolon()
            end,
            desc = 'Put a semicolon at the end of the line',
        },
        {
            '<C-.>',
            function()
                require('put_at_end').put_period()
            end,
            desc = 'Put a period at the end of the line',
        },
        {
            '<C-,>',
            function()
                require('put_at_end').put_comma()
            end,
            desc = 'Put a comma at the end of the line',
        },
    },
}
