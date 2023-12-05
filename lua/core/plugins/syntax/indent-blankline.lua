return {
    'lukas-reineke/indent-blankline.nvim',
    enabled = require('core.enable_plugins').indentblankline,
    event = { 'BufReadPost', 'BufNewFile' },
    opts = { space_char_blankline = ' ', show_current_context = true, show_current_context_start = false },

    -- TODO: GitHub page has rainbow delimiters integration to make scope same color as the delimiter color
    config = function(_, opts)
        require('illuminate').configure(opts)
        require('ibl').setup()
        if require('core.enable_plugins').rainbow_delimiters then
            local highlight = {
                'RainbowRed',
                'RainbowYellow',
                'RainbowBlue',
                'RainbowOrange',
                'RainbowGreen',
                'RainbowViolet',
                'RainbowCyan',
            }
            local hooks = require('ibl.hooks')
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
                vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
                vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
                vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
                vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
                vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
                vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require('ibl').setup({ scope = { highlight = highlight } })

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end
    end,
}
