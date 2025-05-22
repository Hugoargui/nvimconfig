return {
    'chrisgrieser/nvim-various-textobjs',
    enabled = require('core.enable_plugins').various_textobjects,
    event = { 'ModeChanged' }, -- there is no OperatorPendingModeEnter, this is the second best
    config = function()
        require('various-textobjs').setup({

            forwardLooking = {
                -- Number of lines to seek forwards for a text object.
                -- See the overview table in the README for which text object uses which value.
                small = 15,
                big = 30,
            },

            keymaps = {
                -- See overview table in README for the defaults. (Note that lazy-loading
                -- this plugin, the default keymaps cannot be set up. if you set this to
                -- `true`, you thus need to add `lazy = false` to your lazy.nvim config.)
                useDefaults = false,

                -- disable only some default keymaps, for example { "ai", "!" }
                -- (only relevant when you set `useDefaults = true`)
                ---@type string[]
                disabledDefaults = {},
            },
        })

        vim.keymap.set({ "o", "x" }, "iw", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
        vim.keymap.set({ "o", "x" }, "w", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
        --
        -- just examples for testing word motions right here:
        -- uint_type exampleTestFoo() = '<cmd>lua this("always-gives").problems(always)'
        -- camelCaseWord()

        vim.keymap.set({ 'o', 'x' }, 'i<CR>', ':<c-u>normal! ggVG<CR>', { desc = 'Whole Document' }) -- vi<ENTER> selects whole buffer

        vim.keymap.set({ 'o', 'x' }, 'il', ':<c-u>normal! $v^<CR>', { desc = 'Line' })               -- in line
        vim.keymap.set({ 'o', 'x' }, 'al', ':<c-u>normal! $v0<CR>', { desc = 'Line' })               -- around line
        vim.keymap.set(
            { 'o', 'x' },
            'ai',
            '<cmd>lua require("various-textobjs").indentation(false, true)<CR>',
            { desc = 'Indentation' }
        )
        vim.keymap.set(
            { 'o', 'x' },
            'ii',
            '<cmd>lua require("various-textobjs").indentation(true, true)<CR>',
            { desc = 'Indentation' }
        )
        vim.keymap.set(
            { 'o', 'x' },
            'ar',
            '<cmd>lua require("various-textobjs").restOfParagraph(false)<CR>',
            { desc = 'Rest of Paragraph' }
        )
        vim.keymap.set(
            { 'o', 'x' },
            'ir',
            '<cmd>lua require("various-textobjs").restOfIndentation(false)<CR>',
            { desc = 'Rest of Indentation' }
        )
        -- Create Delete Surrounding Indentation mapping as in the documentation
        vim.keymap.set("n", "dsi", function()
            -- select outer indentation
            require("various-textobjs").indentation("outer", "outer")

            -- plugin only switches to visual mode when a textobj has been found
            local indentationFound = vim.fn.mode():find("V")
            if not indentationFound then return end

            -- dedent indentation
            vim.cmd.normal { "<", bang = true }

            -- delete surrounding lines
            local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1]
            local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1]
            vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
            vim.cmd(tostring(startBorderLn) .. " delete")
        end, { desc = "Delete Surrounding Indentation" })

        -- column text object:
        -- THE COLUMN TEXTOBJ takes an optional parameter for direction:
        -- "down" (default), "up", "both"
        vim.keymap.set(
            { "o", "x" },
            "|",
            '<cmd>lua require("various-textobjs").column("both")<CR>'
        )
        vim.keymap.set(
            { "o", "x" },
            "a|",
            '<cmd>lua require("various-textobjs").column("down")<CR>'
        )
        vim.keymap.set(
            { "o", "x" },
            "i|",
            '<cmd>lua require("various-textobjs").column("up")<CR>'
        )

        -- i and a do kind of the same.. Think about reuses
        vim.keymap.set({ 'o', 'x' }, 'ak', '<cmd>lua require("various-textobjs").key("outer")<CR>', { desc = 'Key' })
        vim.keymap.set({ 'o', 'x' }, 'ik', '<cmd>lua require("various-textobjs").key("inner")<CR>', { desc = 'Key' })
        vim.keymap.set({ 'o', 'x' }, 'av', '<cmd>lua require("various-textobjs").value("outer")<CR>', { desc = 'Value' })
        vim.keymap.set({ 'o', 'x' }, 'iv', '<cmd>lua require("various-textobjs").value("inner")<CR>', { desc = 'Value' })
    end,
}
