-- Better resize than default
return {
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
    end,
}
