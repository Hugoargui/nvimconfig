local M = {
    'jonatan-branting/nvim-better-n',

    keys = {
        {
            'n',
            function()
                require('better-n').n()
            end,
        },
        {
            'N',
            function()
                require('better-n').shift_n()
            end,
        },
        { ',' },
        { ';' },
    },
    config = function()
        require('better-n').setup({
            callbacks = {
                mapping_executed = function()
                    -- Clear highlighting, indicating that `n` will not goto the next
                    -- highlighted search-term
                    vim.cmd([[ nohl ]])
                end,
            },
            mappings = {
                -- I want `n` to always go forward, and `<s-n>` to always go backwards
                ['*'] = { previous = '<s-n>', next = 'n' },
                -- TODO: can't get it to work
                ['#'] = { previous = 'n', next = '<s-n>' },
                ['F'] = { previous = ',', next = ';' },
                ['T'] = { previous = ',', next = ';' },

                -- Setting `cmdline = true` ensures that `n` will only be
                -- overwritten if the search command is succesfully executed
                ['/'] = { previous = '<s-n>', next = 'n', cmdline = true },
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
    end,
}

return M
