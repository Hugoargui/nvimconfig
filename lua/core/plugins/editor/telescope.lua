return {
    'nvim-telescope/telescope.nvim',
    enabled = require('core.enable_plugins').telescope,
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
            live_grep = {
                prompt_title = 'Search string in project',
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
                        ['<C-g>'] = require('telescope.actions.layout').toggle_preview,

                        ['<C-j>'] = actions.move_selection_next, -- scroll the list with <c-j>
                        ['<C-k>'] = actions.move_selection_previous, -- scroll the list with <c-k>
                        ['<C-v>'] = actions.select_vertical, -- open selection in new vertical split
                        ['<C-x>'] = actions.select_horizontal, -- open selection in new horizantal split
                        ['<C-t>'] = actions.select_tab, -- open selection in new tab

                        ['<C-s>'] = actions.toggle_all, -- Toggle multi selection for all entries
                        ['<C-z>'] = actions.drop_all, -- Drop all entries from the current multiselection.

                        ['<C-n>'] = actions.cycle_history_next,
                        ['<C-p>'] = actions.cycle_history_prev,

                        ['<A-u>'] = actions.preview_scrolling_up, -- unfortunately C-u more usefult o clear promt
                        ['<A-d>'] = actions.preview_scrolling_down, -- unfortunately C-d more useful as del

                        ['<C-u>'] = false, -- default is scrolling down preview, I prefer to get clear prompt
                        ['<C-d>'] = false, -- default is scrolling down preview, I prefer to get delete
                        ['<Up>'] = false, -- Don't clutter keymaps help
                        ['<Down>'] = false, -- Don't clutter keymaps help
                        ['<C-C>'] = false, -- Otherwise shows as "anonymous" in preview
                    },
                }, -- mappings
                initial_mode = 'insert',
                selection_strategy = 'reset',
                sorting_strategy = 'ascending',
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = { prompt_position = 'top', height = .999, width = .999 },
                },
            }, -- defaults
            pickers = pickers,
            extensions = extensions,
        })

        telescope.load_extension('fzf')
        -- telescope.load_extension "projects"
    end,
}
