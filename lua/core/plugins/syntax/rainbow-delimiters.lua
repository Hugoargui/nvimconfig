-- ON WINDOWS LAPTOP CLONE KEEPS FAILING FROM LAZY
-- I CLONED A LOCAL COPIE AND IT WORKS
if (vim.fn.has('win32')) then
    return {
        -- 'HiPhish/rainbow-delimiters.nvim',
        dir = [[C:\rainbow]],
        enabled = require('core.enable_plugins').rainbow_delimiters,
        lazy = false,
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
else
    return {
        'HiPhish/rainbow-delimiters.nvim',
        enabled = require('core.enable_plugins').rainbow_delimiters,
        event = { 'BufReadPost', 'BufNewFile' },
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
end
