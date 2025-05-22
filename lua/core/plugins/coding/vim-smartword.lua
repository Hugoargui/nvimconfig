return {
    'anuvyklack/vim-smartword',

    -- TODO: spider already handles small word motion
    -- this could be an extra pattern in spider,
    -- or this: https://old.reddit.com/r/neovim/comments/181bsu8/my_take_on_a_word_movement/
    -- enabled = require('core.enable_plugins').smartword,
    enabled = false,
    keys = { 'W', 'E', 'B', 'Q' },
    config = function()
        -- ----------------------------------------------------
        -- For the smartword plugin
        -- This adds motions, but no text objects, I'll create a custom textobject
        vim.keymap.set(
        -- { 'n', 'o', 'x' },
            { 'n' },
            'W',
            '<Plug>(smartword-w)',
            { noremap = false, silent = true, desc = 'Next WORD' }
        )
        vim.keymap.set(
        -- { 'n', 'o', 'x' },
            { 'n' },
            'B',
            '<Plug>(smartword-b)',
            { noremap = false, silent = true, desc = 'Last WORD' }
        )
        vim.keymap.set(
        -- { 'n', 'o', 'x' },
            { 'n' },
            'E',
            '<Plug>(smartword-e)',
            { noremap = false, silent = true, desc = 'End of next WORD' }
        )
        vim.keymap.set(
        -- { 'n', 'o', 'x' },
            { 'n' },
            'Q',
            '<Plug>(smartword-ge)',
            { noremap = false, silent = true, desc = 'End of last WORD' }
        )

        -- -- TODO: For now iW needs to be  at beginning of word, find a way to make it jump to beginning automatically
        vim.keymap.set({ 'o', 'x' }, 'W', '<Plug>(smartword-e)')
        -- vim.keymap.set({ "o", "x" }, "aa", ":<c-u>normal! BvW<CRvim.keymap.set({ "o", "x" }, "ia", ":s/<Plug>(smartword-e)")")
    end,
}
