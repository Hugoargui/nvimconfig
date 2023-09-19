return {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        -- This module contains a number of default definitions
        local rainbow_delimiters = require('rainbow-delimiters')

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            -- Which query to use for finding delimiters
            query = {
                [''] = 'rainbow-delimiters',
                html = 'rainbow-tags',
                lua = 'rainbow-blocks',
            },
            highlight = {
                'RainbowDelimiterOrange',
                'RainbowDelimiterBlue',
                'RainbowDelimiterRed',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterYellow',
                'RainbowDelimiterCyan',
            },
        }
    end,
}
