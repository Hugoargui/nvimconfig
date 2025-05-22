return {
    'chrisgrieser/nvim-spider',
    enabled = require('core.enable_plugins').spider,
    -- add also operators as I didn't find a way yet to activate it on operator pending mode
    keys = { 'w', 'e', 'b', 'q', 'W', 'B', 'E', 'Q', 'v', 'y', 'd', 'm', 'X', 's', 'c' },
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

        local patternEndOfWord = [[\w\>]]

        -- local words = wordAfterSymbol .. '|' .. isolatedPunctuation
        local words = wordAfterSymbol -- jump only to alpha words, use smaller motions for punct
        local patterBegiiningOfWORD = [[\v]] .. words
        vim.keymap.set({ 'n', 'v' }, 'W', function()
            vim.fn.search(patterBegiiningOfWORD)
        end)
        vim.keymap.set({ 'n', 'v' }, 'B', function()
            vim.fn.search(patterBegiiningOfWORD, 'b')
        end)
        vim.keymap.set({ 'n', 'v' }, 'E', function()
            vim.fn.search(patternEndOfWord)
        end)
        vim.keymap.set({ 'n', 'v' }, 'Q', function()
            vim.fn.search(patternEndOfWord, 'b')
        end)

        -- FIXME: not working for visual mode...
        vim.keymap.set({ 'o', 'x' }, 'iW', function()
            vim.fn.search(patterBegiiningOfWORD, 'b')
            vim.cmd([[normal v]])
            vim.fn.search(patternEndOfWord)
        end, { desc = "WHOLE WORD" })
    end,
}
