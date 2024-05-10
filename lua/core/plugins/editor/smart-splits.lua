-- Better resize than default
return {
    enabled = require('core.enable_plugins').smart_splits,
    'mrjones2014/smart-splits.nvim', -- used by hydra window-manager
    dependencies = { 'kwkarlwang/bufresize.nvim' },
    keys = {
        -- '<Left>',
        -- '<Right>',
        -- '<Up>',
        -- '<Right>',
        -- '<M-Left>',
        -- '<M-Down>',
        -- '<M-Up>',
        -- '<M-Right>',
        -- '<C-Left>',
        -- '<C-Up>',
        -- '<C-Down>',
        -- '<C-Right>',
        -- '<C-h>',
        -- '<C-j>',
        -- '<C-k>',
        -- '<C-l>',
        -- '<M-h>',
        -- '<M-j>',
        -- '<M-k>',
        -- '<M-l>',
        -- '<C-H>',
        -- '<C-J>',
        -- '<C-K>',
        -- '<C-L>',
        '<M-m>',
        '<M-,>',
        '<M-,>',
        '<M-/>',
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

        -- Problem: other mappings I tried are not as ergonomic as C-hjkl,
        -- but I'm so used to C-l in terminal! find solution
        keymap.set('n', '<M-m>', require('smart-splits').move_cursor_left)
        keymap.set('n', '<M-,>', require('smart-splits').move_cursor_down)
        keymap.set('n', '<M-.>', require('smart-splits').move_cursor_up)
        keymap.set('n', '<M-/>', require('smart-splits').move_cursor_right)

        -- keymap.set('n', '<M-m>', require('smart-splits').resize_left, { silent = true })
        -- keymap.set('n', '<M-,>', require('smart-splits').resize_up, { silent = true })
        -- keymap.set('n', '<M-.>', require('smart-splits').resize_down, { silent = true })
        -- keymap.set('n', '<M-/>', require('smart-splits').resize_right, { silent = true })

        -- keymap.set('n', '<C-H>', require('smart-splits').swap_buf_left)
        -- keymap.set('n', '<C-J>', require('smart-splits').swap_buf_down)
        -- keymap.set('n', '<C-K>', require('smart-splits').swap_buf_up)
        -- keymap.set('n', '<C-L>', require('smart-splits').swap_buf_right)
    end,
}
