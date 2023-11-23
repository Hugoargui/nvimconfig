return {
    'lukas-reineke/indent-blankline.nvim',
    enabled = require('core.enable_plugins').indentblankline,
    event = { 'BufReadPost', 'BufNewFile' },
    opts = { space_char_blankline = ' ', show_current_context = true, show_current_context_start = false },

    -- TODO: since jump from v2 to v3 I'm not sure if I'm setting this up correctly, think about how I want it to look
    -- TODO: GitHub page has rainbow delimiters integration to make scope same color as the delimiter color
    config = function(_, opts)
        require('illuminate').configure(opts)
        require('ibl').setup()
    end,
}
