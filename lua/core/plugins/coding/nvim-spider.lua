return {
    'chrisgrieser/nvim-spider',
    keys = { 'w', 'e', 'b', 'q' },
    config = function()
        require('spider').setup({
            skipInsignificantPunctuation = true,
        })
        -- For spider casemotion plugin, and skip insignificant puntuation (on by default)
        -- This doesnt add text-objects, that's done by the more textobjects plugin
        vim.keymap.set({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<CR>", { desc = 'Spider-w' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<CR>", { desc = 'Spider-e' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<CR>", { desc = 'Spider-b' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'q', "<cmd>lua require('spider').motion('ge')<CR>", { desc = 'Spider-ge' })
    end,
}
