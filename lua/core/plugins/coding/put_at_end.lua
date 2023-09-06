-- Small Neovim plugin that provides keymaps for putting certain characters (or strings)
-- at the end of the current line (but before the comment if the line has one) without moving your cursor.
return {
    enabled = true, -- would love this plugin, but can't clone it
    'rareitems/put_at_end.nvim',
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
