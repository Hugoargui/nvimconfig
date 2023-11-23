return {
    'kylechui/nvim-surround',
    enabled = require('core.enable_plugins').mini_surround,
    keys = {
        {
            'ys',
            desc = 'Add surrounding',
        },
        {
            'yS',
            desc = 'Add surrounding on new lines',
        },
        {
            'ds',
            desc = 'Delete surrounding',
        },
        {
            'cs',
            desc = 'Changes surrounding',
        },
        {
            'cS',
            desc = 'Changes surrounding, on new line',
        },
        {
            'ys',
            mode = 'x',
            desc = 'Add surrounding',
        },
        {
            'yS',
            mode = 'x',
            desc = 'Add surrounding line',
        },
        {
            'yss',
            desc = 'Surround line',
            noremap = true,
        },
        {
            'ySS',
            desc = 'Surround line on new lines',
            noremap = true,
        },
    },

    config = function()
        require('nvim-surround').setup({
            keymaps = {
                visual = 'ys',
                visual_line = 'yS',
            },
        })
    end,
}
