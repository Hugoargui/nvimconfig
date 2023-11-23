-- Better resize than default
return {
	enabled = false,
    'mrjones2014/smart-splits.nvim', -- used by hydra window-manager
    dependencies = { 'kwkarlwang/bufresize.nvim' },
    keys = {
        '<Left>',
        '<Right>',
        '<Up>',
        '<Right>',
        '<M-Left>',
        '<M-Down>',
        '<M-Up>',
        '<M-Right>',
        '<C-Left>',
        '<C-Up>',
        '<C-Down>',
        '<C-Right>',
        'Leader<w>',
        '<C-w>',
    },
    config = function()
        require('smart-splits').setup({
            resize_mode = {
                hooks = {
                    on_leave = require('bufresize').register,
                },
            },
        })

        local keymap = vim.keymap --for conciseness

        -- I'm not using <Control-hjkl> because I'm too used to press ctrl-l when inside toggleterm.
        keymap.set('n', '<Left>', require('smart-splits').move_cursor_left)
        keymap.set('n', '<Down>', require('smart-splits').move_cursor_down)
        keymap.set('n', '<Up>', require('smart-splits').move_cursor_up)
        keymap.set('n', '<Right>', require('smart-splits').move_cursor_right)

        keymap.set('n', '<M-Left>', require('smart-splits').swap_buf_left)
        keymap.set('n', '<M-Down>', require('smart-splits').swap_buf_down)
        keymap.set('n', '<M-Up>', require('smart-splits').swap_buf_up)
        keymap.set('n', '<M-Right>', require('smart-splits').swap_buf_right)

        keymap.set('n', '<C-Left>', require('smart-splits').resize_left, { silent = true })
        keymap.set('n', '<C-Up>', require('smart-splits').resize_up, { silent = true })
        keymap.set('n', '<C-Down>', require('smart-splits').resize_down, { silent = true })
        keymap.set('n', '<C-Right>', require('smart-splits').resize_right, { silent = true })
    end,
}
