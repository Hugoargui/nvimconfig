return {
    'gbprod/substitute.nvim',
    enabled = require('core.enable_plugins').substitute,
    keys = {
        {
            's',
            ":lua require('substitute').operator()<CR>",
            desc = 'Substitute Operator',
            silent = true,
        },
        {
            'ss',
            ":lua require('substitute').line()<CR>,",
            desc = 'Substitute Line',
            silent = true,
        },
        {
            'S',
            ":lua require('substitute').eol()<CR>,",
            desc = 'Substitute to EOL',
            silent = true,
        },
        {
            's',
            'P', -- at the end the builtin works better
            mode = 'x',
            desc = 'Substitute Visual Selection',
            silent = true,
        },
        -- Plugin also comes with exchange operators.
        {
            'X',
            ":lua require('substitute.exchange').operator()<CR>",
            desc = 'eXchange Operator',
            noremap = true,
            silent = true,
        },
        {
            'sxx',
            ":lua require('substitute.exchange').line()<CR>,",
            desc = 'eXchange Line',
            noremap = true,
            silent = true,
        },
        {
            'X',
            mode = 'x',
            ":lua require('substitute.exchange').visual()<CR>,",
            desc = 'eXchange Line',
            silent = true,
        },
        {
            'sxc',
            ":lua require('substitute.exchange').cancel()<CR>,",
            desc = 'eXchange Cancel',
            silent = true,
        },
    },
    config = function()
        require('substitute').setup({
            highlight_substituted_text = {
                enabled = true,
                timer = 500,
            },
        })
    end,
}
