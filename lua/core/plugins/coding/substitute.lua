return {
    'gbprod/substitute.nvim',
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
            ":lua require('substitute').visual()<CR>,",
            mode = 'v',
            desc = 'Substitute Visual Selection',
            silent = true,
        },
        -- Plugin also comes with exchange operators.
        {
            -- TODO: not working for this mapping
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
            mode = 'v',
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
        require('substitute').setup({})
    end,
}
