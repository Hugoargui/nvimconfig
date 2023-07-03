return {
    'ziontee113/icon-picker.nvim',
    dependencies = 'stevearc/dressing.nvim',
    cmd = { 'IconPickerInsert', 'IconPickerNormal', 'IconPickerYank' },
    keys = {
        { '<leader>I', '<cmd>IconPickerNormal<cr>', desc = 'Insert Icon/Emoji', mode = 'n' },
        -- There is alsy icon picker yank, see GitHub
        { '<c-I>', '<cmd>IconPickerInsert<cr>', desc = 'Insert Icon/Emoji', mode = 'i' },
    },
    config = function()
        require('icon-picker').setup({
            disable_legacy_commands = true,
        })
    end,
}
