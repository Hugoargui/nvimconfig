return {
    'levouh/tint.nvim',
    event = 'VeryLazy',

    opts = {
        tint = -40, -- Darquen colors, use a positive value to brighten
        saturation = 0.9, -- Saturation to preserve
        window_ignore_function = function(winid)
            local bufid = vim.api.nvim_win_get_buf(winid)
            local buftype = vim.api.nvim_buf_get_option(bufid, 'buftype')
            local floating = vim.api.nvim_win_get_config(winid).relative ~= ''

            -- Do not tint `terminal` or floating windows, tint everything else
            return buftype == 'terminal' or floating
        end,
        highlight_ignore_patterns = {
            'Telescope*',
            'WinSeparator',
            'NvimTreeWinSeparator',
            'NvimTreeIndentMarker',
            'IndentBlanklineChar',
            'IndentBlanklineSpaceChar',
            'IndentBlanklineSpaceCharBlankline',
            'LineNr',
            'NonText',
            'EndOfBuffer',
        }, -- Highlight group patterns to ignore, see `string.find`
    },
}
