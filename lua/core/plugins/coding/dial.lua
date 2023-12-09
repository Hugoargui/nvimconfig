return {
    'monaqa/dial.nvim',
    keys = {
        '<C-a>',
        '<C-x>',
        'g<C-a>',
        'g<C-x>',
        { 'g<C-a>', mode = 'v' },
        { 'g<C-x>', mode = 'v' },
        { '<C-a>', mode = 'v' },
        { '<C-x>', mode = 'v' },
    },
    config = function()
        local augend = require('dial.augend')
        require('dial.config').augends:register_group({
            -- default augends used when no group name is specified
            default = {
                augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
                augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                augend.integer.alias.binary, -- nonnegative binary number (0b0101, 0b11001111, ...)
                augend.integer.alias.octal, -- nonnegative octal number (0x00, 0o24, ...)
                augend.date.alias['%Y/%m/%d'], -- date (2023/14/19, etc.)
                augend.date.alias['%d/%m/%Y'], -- date (10/11/1989, etc.)
                augend.constant.alias.bool, -- boolean value (true <-> false)
                augend.constant.new({
                    elements = { 'uint8_t', 'uint16_t', 'uint32_t', 'uint64_t' },
                    word = true, -- Don't increment if part of a bigger word
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = { 'int8_t', 'int16_t', 'int32_t', 'int_64t' },
                    word = false, -- Don't increment if part of a bigger word
                    cyclic = true,
                }),
            },
        })
        vim.keymap.set('n', '<C-a>', function()
            require('dial.map').manipulate('increment', 'normal')
        end)
        vim.keymap.set('n', '<C-x>', function()
            require('dial.map').manipulate('decrement', 'normal')
        end)
        vim.keymap.set('n', 'g<C-a>', function()
            require('dial.map').manipulate('increment', 'gnormal')
        end)
        vim.keymap.set('n', 'g<C-x>', function()
            require('dial.map').manipulate('decrement', 'gnormal')
        end)
        vim.keymap.set('v', '<C-a>', function()
            require('dial.map').manipulate('increment', 'visual')
        end)
        vim.keymap.set('v', '<C-x>', function()
            require('dial.map').manipulate('decrement', 'visual')
        end)
        vim.keymap.set('v', 'g<C-a>', function()
            require('dial.map').manipulate('increment', 'gvisual')
        end)
        vim.keymap.set('v', 'g<C-x>', function()
            require('dial.map').manipulate('decrement', 'gvisual')
        end)
    end,
}
