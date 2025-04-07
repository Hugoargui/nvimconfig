-- Better resize than default
return {
    enabled = require('core.enable_plugins').smart_splits,
    'mrjones2014/smart-splits.nvim',

    init = function()
        vim.keymap.set('n', '<C-A-h>', require('smart-splits').resize_left)
        vim.keymap.set('n', '<C-A-j>', require('smart-splits').resize_down)
        vim.keymap.set('n', '<C-A-k>', require('smart-splits').resize_up)
        vim.keymap.set('n', '<C-A-l>', require('smart-splits').resize_right)
        -- moving between splits
        vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left)
        vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down)
        vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up)
        vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right)
        -- swapping buffers between windows
        -- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
        -- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
        -- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
        -- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
    end
}
