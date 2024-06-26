return {
    {
        'gaoDean/autolist.nvim',
        enabled = require('core.enable_plugins').autolist,
        ft = {
            'markdown',
            'text',
            'tex',
            'plaintex',
            'norg',
        },
        config = function()
            require('autolist').setup({
                colon = { -- if a line ends in a colon
                    indent = false, -- if in list and line ends in `:` then create list
                    indent_raw = false, -- above, but doesn't need to be in a list to work
                    preferred = '-', -- what the new list starts with (can be `1.` etc)
                },
                cycle = { -- Cycles the list type in order
                    '-', -- whatever you put here will match the first item in your list
                    -- '*', -- for example if your list started with a `-` it would go to `*`
                    '1.', -- this says that if your list starts with a `*` it would go to `1.`
                    -- '1)', -- this all leverages the power of recalculate.
                    -- 'a)', -- i spent many hours on that function
                    -- 'I.', -- try it, change the first bullet in a list to `a)`, and press recalculate
                },
            })

            -- This are annoying when pressing tab in markdown codeblocks
            -- vim.keymap.set('i', '<tab>', '<cmd>AutolistTab<cr>')
            -- vim.keymap.set('i', '<s-tab>', '<cmd>AutolistShiftTab<cr>')
            vim.keymap.set('i', '<CR>', '<CR><cmd>AutolistNewBullet<cr>')
            vim.keymap.set('n', 'o', 'o<cmd>AutolistNewBullet<cr>')
            vim.keymap.set('n', 'O', 'O<cmd>AutolistNewBulletBefore<cr>')

            -- vim.keymap.set('n', '<CR>', '<cmd>AutolistToggleCheckbox<cr><CR>')
            -- vim.keymap.set('n', '<C-r>', '<cmd>AutolistRecalculate<cr>')

            -- cycle list types with dot-repeat
            vim.keymap.set(
                'n',
                '<leader>ac',
                require('autolist').cycle_next_dr,
                { desc = 'autolist cycle', expr = true }
            )
            -- vim.keymap.set(
            --     'n',
            --     '<leader>ap',
            --     require('autolist').cycle_prev_dr,
            --     { desc = 'list cycle prev', expr = true }
            -- )

            -- if you don't want dot-repeat
            -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
            -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

            -- functions to recalculate list on edit
            -- vim.keymap.set('n', '>>', '>><cmd>AutolistRecalculate<cr>') -- a bit annoying when editing codeblocks
            -- vim.keymap.set('n', '<<', '<<<cmd>AutolistRecalculate<cr>') -- a bit annoying when editing codeblocks
            vim.keymap.set('n', 'dd', 'dd<cmd>AutolistRecalculate<cr>')
            vim.keymap.set('v', 'd', 'd<cmd>AutolistRecalculate<cr>')
        end,
    },
}
