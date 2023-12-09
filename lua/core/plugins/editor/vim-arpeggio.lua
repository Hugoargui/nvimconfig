return {
    'kana/vim-arpeggio',
    dependencies = {
        { 'folke/which-key.nvim' },
    },
    config = function()
        vim.api.nvim_exec('Arpeggio inoremap jf <ESC>', false)

        if require('core.enable_plugins').smart_splits then
            vim.api.nvim_exec(
                "Arpeggio nnoremap <silent> jk :lua require('smart-splits').move_cursor_left()<CR>",
                false
            )
            vim.api.nvim_exec(
                "Arpeggio nnoremap <silent> j; :lua require('smart-splits').move_cursor_down()<CR>",
                false
            )
            vim.api.nvim_exec(
                "Arpeggio nnoremap <silent> l; :lua require('smart-splits').move_cursor_right()<CR>",
                false
            )

            vim.api.nvim_exec("Arpeggio nnoremap <silent> kl :lua require('smart-splits').move_cursor_up()<CR>", false)
        end
    end,
}
