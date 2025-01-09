return {
    'levouh/tint.nvim',
    enabled = require('core.enable_plugins').tint,
    event = 'VeryLazy',

    opts = {
        tint = -80, -- Darquen colors, use a positive value to brighten
        saturation = 0.4, -- Saturation to preserve
        window_ignore_function = function(winid)
            local bufid = vim.api.nvim_win_get_buf(winid)
            local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufid })

            local floating = vim.api.nvim_win_get_config(winid).relative ~= ''

            local buff_absolute_path = vim.api.nvim_buf_get_name(bufid) -- OUTLINE is from symbols outline plugin
            local lastSlashIndex = (buff_absolute_path:reverse()):find('%/')
            local fileName = ''
            if lastSlashIndex ~= nil then
                fileName = buff_absolute_path:sub(1 - lastSlashIndex)
            end

            -- Do not tint `terminal` or floating windows, tint everything else
            return (buftype == 'terminal') or (fileName == 'OUTLINE') or floating
            -- return (buftype == 'terminal') or floating
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
            'Comment',
        }, -- Highlight group patterns to ignore, see `string.find`
    },
}
