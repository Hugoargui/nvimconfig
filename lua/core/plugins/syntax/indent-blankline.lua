return {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = { space_char_blankline = ' ', show_current_context = true, show_current_context_start = false },
}
