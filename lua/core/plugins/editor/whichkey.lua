local M = {
    'folke/which-key.nvim',
    enabled = require('core.enable_plugins').whickhey,
    event = 'VeryLazy',
    config = function()
        -- Setup {{{*/
        local setup = {
            plugins = {
                marks = false, -- shows a list of your marks on ' and `
                registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = false, -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = false, -- default bindings on <c-w>
                    nav = false, -- misc bindings to work with windows
                    z = false, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
            },
            -- add operators that will trigger motion and text object completion
            -- to enable all native operators, set the preset / operators plugin above
            operators = {
                gc = 'Comment',
                ys = 'Surround',
                ga = 'Change Case',
            },
            show_keys = true,

            key_labels = {
                -- override the label used to display some keys. It doesn't effect WK in any other way.
                -- For example:
                -- ["<space>"] = "SPC",
                -- ["<cr>"] = "RET",
                -- ["<tab>"] = "TAB",
            },
            icons = {
                breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
                -- separator = ">", -- symbol used between a key and it's label
                group = '+', -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = '<c-d>', -- binding to scroll down inside the popup
                scroll_up = '<c-u>', -- binding to scroll up inside the popup
            },
            window = {
                border = 'rounded', -- none, single, double, shadow
                position = 'bottom', -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
                align = 'left', -- align columns left, center or right
            },
            ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
            hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
            show_help = true, -- show help message on the command line when the popup is visible
            triggers = 'auto', -- automatically setup triggers
            -- triggers = {"<leader>"} -- or specify a list manually
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for key maps that start with a native binding
                -- most people should not need to change this
                i = { 'j', 'k' },
                v = { 'j', 'k' },
            },
        }
        --}}}

        -----------------------------------------------------------------------------------------------------------------
        -- Leader mappings {{{*/
        local leader_opts = {
            mode = 'n', -- NORMAL mode
            prefix = '<leader>',
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true, -- use `nowait` when creating keymaps
        }

        local leader_mappings = {
            ['+'] = { name = '   CPP specific options' },
            ['e'] = { name = '   File Explorer' },
            ['c'] = { '<cmd>Themery<cr>', '🎨 ColorSchemes' },

            ['f'] = {
                "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
                '  Find files',
            },
            ['F'] = { '<cmd>Telescope find_files<cr>', '  Find Files with preview' },
            ['r'] = { '<cmd>Telescope resume<CR>', '  RESUME last search' },

            q = {
                name = ' ❌ Quit nVim',
                ['q'] = { '<cmd>q<CR>', '"q  " ->  Quit this if no changes' },
                ['a'] = { '<cmd>qa<CR>', '"qa " ->  Quit all if no changes' },
                ['Q'] = { '<cmd>q!<CR>', '"q! " ->  Quit this without saving' },
                ['A'] = { '<cmd>qa!<CR>', '"qa!" ->  Quit all without saving' },
                ['w'] = { '<cmd>wq<CR>', '"wq " ->  Save this and quit' },
                ['W'] = { '<cmd>wqa<CR>', '"wqa" ->  Save all and quit' },
            },
            ['o'] = { name = ' 🔔 Notifications' },

            x = {
                name = ' 冷  Session Management',
                ['x'] = { '<cmd>SearchSession<cr>', 'Search Session' },
                ['s'] = { '<cmd>SessionSave<cr>', 'Save or Create session' },
                ['d'] = { '<cmd>AutoSession delete<cr>', 'Delete Sessions' },
                ['c'] = { '<cmd>cd %:p:h <cr>', 'Change working directory to the location of the current file' },
            },

            w = {
                name = '   Window  management',
                ['v'] = { '<c-w>v<cr>', '匿 Split vertically' },
                ['h'] = { '<C-w>s>', '鱗 Split horizontally' },
                ['e'] = { '<C-w> =<CR>', ' Make splits equal size' },
                ['q'] = { '<cmd>close<CR>', ' Close current window' },
                ['o'] = { '<cmd>only<CR>', ' Close all other windows' },
                ['z'] = { '<cmd>MaximizerToggle<CR>', ' Window Zoom' },
            },

            g = {
                name = '   Git',
                g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', ' Lazygit' },
                j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", '➡ Next Hunk' },
                k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", '⬅ Prev Hunk' },
                l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", ' Blame Line Hover' },
                L = { "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<cr>", '↴ Toggle Blame Line' },
                p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", ' Preview Hunk' },
                r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'ﰸ Reset Hunk' },
                R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", ' Reset Buffer' },
                s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", ' Stage Hunk' },
                u = {
                    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                    '碑 Undo Stage Hunk',
                },
                o = { '<cmd>Telescope git_status<cr>', ' Open changed file' },
                b = { '<cmd>Telescope git_branches<cr>', ' Checkout branch' },
                c = { '<cmd>Telescope git_commits<cr>', ' Checkout commit' },
                d = {
                    '<cmd>Gitsigns diffthis HEAD<cr>',
                    ' Diff',
                },
            },

            m = {
                name = ' 🟢 Make/Build',
            },
            l = {
                name = '   LSP',
                -- TODO: this don't show
                k = { name = ' LSP change symbol Case' },
                n = { name = 'LSP swap with next' },
                l = { name = 'LSP swap with previous' },
            },
            i = {
                name = '   Diagnostics',
            },
            ['t'] = { name = '   Trouble Diagnostics' },
            d = {
                name = '   Debugger',
            },
            s = {
                name = '   Search',
                s = { '<cmd>Telescope live_grep<cr>', '  Find Text' },
                h = { '<cmd>Telescope highlights<CR>', '  Search Highligts' },
                b = { '<cmd>Telescope git_branches<cr>', '  Checkout branch' },
                H = { '<cmd>Telescope help_tags<cr>', '  Find Help' },
                M = { '<cmd>Telescope man_pages<cr>', '  Man Pages' },
                r = { '<cmd>Telescope oldfiles<cr>', '  Open Recent File' },
                R = { '<cmd>Telescope registers<cr>', '  Registers' },
                k = { '<cmd>Telescope keymaps<cr>', '  Keymaps' },
                c = { '<cmd>Telescope commands<cr>', 'ﯯ  Commands' },
            },
        }

        require('which-key').setup(setup)
        require('which-key').register(leader_mappings, leader_opts)

        -- [% and ]% come from vim builting plugin, it shows up if we anable []  in whichkey
        -- with the <plug> name, so may as well document it
        require('which-key').register({
            ['[%'] = 'which_key_ignore',
            [']%'] = 'which_key_ignore',
        })

        --}}}
    end,
}

return M
