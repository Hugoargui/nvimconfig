return {
    'nvim-telescope/telescope.nvim',
    module = true,
    cmd = 'Telescope',
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    config = function()
        local telescope = require('telescope')

        local actions = require('telescope.actions')

        local pickers = {
            oldfiles = {
                prompt_title = 'Recent Files',
            },
        }

        local extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        }

        telescope.setup({
            defaults = {
                prompt_prefix = '> ',
                selection_caret = '> ',
                mappings = {
                    i = {
                        ['<Esc>'] = actions.close, -- don't go into normal mode, just close
                        ['<C-j>'] = actions.move_selection_next, -- scroll the list with <c-j>
                        ['<C-k>'] = actions.move_selection_previous, -- scroll the list with <c-k>
                        ['<C-h>'] = actions.select_horizontal, -- open selection in new horizantal split
                        ['<C-v>'] = actions.select_vertical, -- open selection in new vertical split
                        ['<C-t>'] = actions.select_tab, -- open selection in new tab
                    },
                }, -- mappings
                initial_mode = 'insert',
                selection_strategy = 'reset',
                sorting_strategy = 'ascending',
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = { prompt_position = 'top' },
                },
            }, -- defaults
            pickers = pickers,
            extensions = extensions,
        })

        telescope.load_extension('fzf')
        -- telescope.load_extension "projects"
    end,
}
