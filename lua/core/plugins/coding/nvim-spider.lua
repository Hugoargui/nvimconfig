return {
    'chrisgrieser/nvim-spider',
    enabled = require('core.enable_plugins').spider,
    keys = { 'w', 'e', 'b', 'q', 'W', 'B' },
    config = function()
        require('spider').setup({
            skipInsignificantPunctuation = true,
        })
        -- For spider casemotion plugin, and skip insignificant puntuation (on by default)
        -- This doesnt add text-objects, that's done by the various-textobjects plugin
        vim.keymap.set({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<CR>", { desc = 'Spider-w' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<CR>", { desc = 'Spider-e' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<CR>", { desc = 'Spider-b' })
        vim.keymap.set({ 'n', 'o', 'x' }, 'q', "<cmd>lua require('spider').motion('ge')<CR>", { desc = 'Spider-ge' })


        -- To restore default cw behaviour:
        vim.keymap.set("n", "cw", "c<cmd>lua require('spider').motion('e')<CR>")
        vim.keymap.set("n", "cW", "cE")

        -- At least one punctuation character
        local punct = '[[:punct:]]+'
        -- Line start or a non-capturing space character
        local punct_start = [[(^|\s@<=)]]
        -- Line end or a non-capturing space character
        local punct_end = [[($|\s@=)]]
        local isolatedPunctuation = punct_start .. punct .. punct_end

        -- match any word (equivalent to [A-Za-z0-9]) character if there is '"({[<>. or space before it
        local wordStartSymbols = [['"({[<>.\-@#$: ]]
        local wordAfterSymbol = "[" .. wordStartSymbols .. "]" .. "@<=" .. [[(\w)]]

        -- local words = wordAfterSymbol .. '|' .. isolatedPunctuation
        local words = wordAfterSymbol -- jump only to alpha words, use smaller motions for punct
        local pattern = [[\v]] .. words
        vim.keymap.set({ 'n', 'v' }, 'W', function()
            vim.fn.search(pattern)
        end)
        vim.keymap.set({ 'n', 'v' }, 'B', function()
            vim.fn.search(pattern, 'b')
        end)
    end,
}
