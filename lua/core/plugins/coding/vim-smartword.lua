return {
    'anuvyklack/vim-smartword',
    keys = { 'W', 'E', 'B', 'Q' },
    config = function()
        -- ----------------------------------------------------
        -- For the smartword plugin
        -- This adds motions, but no text objects, I'll create a custom textobject
        vim.keymap.set(
            { 'n', 'o', 'x' },
            'W',
            '<Plug>(smartword-w)',
            { noremap = false, silent = true, desc = 'Next WORD' }
        )
        vim.keymap.set(
            { 'n', 'o', 'x' },
            'B',
            '<Plug>(smartword-b)',
            { noremap = false, silent = true, desc = 'Last WORD' }
        )
        vim.keymap.set(
            { 'n', 'o', 'x' },
            'E',
            '<Plug>(smartword-e)',
            { noremap = false, silent = true, desc = 'End of next WORD' }
        )
        vim.keymap.set(
            { 'n', 'o', 'x' },
            'Q',
            '<Plug>(smartword-ge)',
            { noremap = false, silent = true, desc = 'End of last WORD' }
        )

        -- -- TODO: For now iW needs to be  at beginning of word, find a way to make it jump to beginning automatically
        vim.keymap.set({ 'o', 'x' }, 'W', '<Plug>(smartword-e)')
        -- vim.keymap.set({ "o", "x" }, "aa", ":<c-u>normal! BvW<CRvim.keymap.set({ "o", "x" }, "ia", ":s/<Plug>(smartword-e)")")
    end,
}
