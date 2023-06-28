local M = {
    'jonatan-branting/nvim-better-n',
    keys = {
        'n',
        'N',
        ';',
        ',',
    },
    config = function()
        require('better-n').setup({
            callbacks = {
                -- mapping_executed = function()
                --     -- Clear highlighting, indicating that `n` will not goto the next
                --     -- highlighted search-term
                --     vim.cmd([[ nohl ]])
                -- end,
            },
            mappings = {
                -- I want `n` to always go forward, and `<s-n>` to always go backwards
                ['*'] = { previous = '<s-n>', next = 'n' },
                ['#'] = { previous = '<s-n>', next = 'n' },
                ['f'] = { previous = ',', next = ';' },
                ['F'] = { previous = ',', next = ';' },
                ['t'] = { previous = ',', next = ';' },
                ['T'] = { previous = ',', next = ';' },

                -- Setting `cmdline = true` ensures that `n` will only be
                -- overwritten if the search command is succesfully executed
                ['/'] = { previous = 'n', next = '<s-n>', cmdline = true },
                ['?'] = { previous = 'n', next = '<s-n>', cmdline = true },

                -- -- I have <leader>hn/hp bound to git-hunk-next/prev
                -- ['<leader>hn'] = { previous = '<leader>hp', next = '<leader>hn' },
                -- ['<leader>hp'] = { previous = '<leader>hp', next = '<leader>hn' },
                --
                -- -- I have <leader>bn/bp bound to buffer-next/prev
                -- ['<leader>bn'] = { previous = '<leader>bp', next = '<leader>bn' },
                -- ['<leader>bp'] = { previous = '<leader>bp', next = '<leader>bn' },
            },
        })
        -- You will have to rebind `n` yourself
        -- vim.keymap.set('n', 'n', require('better-n').n, { nowait = true })
        vim.keymap.set('n', 'n', require('better-n').n, { nowait = true })
        vim.keymap.set('n', 'N', require('better-n').shift_n, { nowait = true })
    end,
}

return M
