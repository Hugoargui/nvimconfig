return {
    'kana/vim-arpeggio',
    dependencies = {
        { 'folke/which-key.nvim' },
    },
    config = function()
        vim.api.nvim_exec('Arpeggio inoremap jf <ESC>', false)
        -- Didn't manage to make asdf and jkl; mappings work in normal mode
    end,
}
