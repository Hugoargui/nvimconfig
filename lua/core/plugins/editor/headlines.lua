return {
    -- This plugin adds highlights for text filetypes, like markdown, orgmode, and neorg.
    'lukas-reineke/headlines.nvim',
    ft = 'markdown',
    enabled = require('core.enable_plugins').headlines,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
        require('headlines').setup({
            markdown = {
                query = vim.treesitter.query.parse(
                    'markdown',
                    [[
              (atx_heading [
                (atx_h1_marker)
                (atx_h2_marker)
                (atx_h3_marker)
                (atx_h4_marker)
                (atx_h5_marker)
                (atx_h6_marker)
              ] @headline)

              (thematic_break) @dash

              (fenced_code_block) @codeblock

              (block_quote_marker) @quote
              (block_quote (paragraph (inline (block_continuation) @quote)))
            ]]
                ),
                headline_highlights = {
                    'Headline1',
                    'Headline2',
                    'Headline3',
                    'Headline4',
                    'Headline5',
                    'Headline6',
                },
                codeblock_highlight = 'CodeBlock',
                dash_highlight = 'Dash',
                dash_string = '-',
                quote_highlight = 'Quote',
                quote_string = '┃',
                fat_headlines = false,
                fat_headline_upper_string = '',
                fat_headline_lower_string = '',
            },
        })
        vim.api.nvim_set_hl(0, 'Headline1', { fg = '#4c9a91', bg = '#224541', italic = false })
        vim.api.nvim_set_hl(0, 'Headline2', { fg = '#6893bf', bg = '#2b3d4f', italic = false })
        vim.api.nvim_set_hl(0, 'Headline3', { fg = '#c99076', bg = '#902e59', italic = false })
        vim.api.nvim_set_hl(0, 'Headline4', { fg = '#80a665', bg = '#3d4f2f', italic = false })
        vim.api.nvim_set_hl(0, 'Headline5', { fg = '#c99076', bg = '#66493c', italic = false })
        vim.api.nvim_set_hl(0, 'Headline6', { fg = '#d3869b', bg = '#6b454f', italic = false })
        vim.api.nvim_set_hl(0, 'CodeBlock', { bg = '#444444' })
    end,
}
