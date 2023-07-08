return {
    'echasnovski/mini.surround',
    enabled = false,
    keys = {
        {
            'ys',
            desc = 'Add surrounding',
        },
        {
            'ds',
            desc = 'Delete surrounding',
        },
        {
            'cs',
            desc = 'Changes surrounding',
        },
        {
            'ys',
            mode = 'x',
            desc = 'Add surrounding',
        },
        {
            'yss',
            desc = 'Surround line',
            noremap = true,
        },
    },

    config = function()
        require('mini.surround').setup({
            mappings = {
                -- TODO: considrer trying the other options later
                add = 'ys',
                delete = 'ds',
                find = '',
                find_left = '',
                highlight = '',
                replace = 'cs',
                update_n_lines = '',

                -- Add this only if you don't want to use extended mappings
                suffix_last = '',
                suffix_next = '',
            },
            search_method = 'cover_or_next',
        })

        -- Make special mapping for "add surrounding for line"
        vim.keymap.set('n', 'yss', 'ys_', { remap = true })
    end,
}
