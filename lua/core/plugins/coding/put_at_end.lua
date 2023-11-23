-- Small Neovim plugin that provides keymaps for putting certain characters (or strings)
-- at the end of the current line (but before the comment if the line has one) without moving your cursor.
return {
    'rareitems/put_at_end.nvim',
    enabled = require('core.enable_plugins').put_at_end,
    keys = {
        {
            '<leader>;',
            function()
                require('put_at_end').put_semicolon()
            end,
            desc = 'Put a semicolon at the end of the line',
        },
        {
            '<leader>.',
            function()
                require('put_at_end').put_period()
            end,
            desc = 'Put a period at the end of the line',
        },
        {
            '<leader>,',
            function()
                require('put_at_end').put_comma()
            end,
            desc = 'Put a comma at the end of the line',
        },
    },
}
