local M = {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = true,
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
        'stevearc/dressing.nvim',
    },
    keys = {
        { '<leader>oo', '<cmd>Noice<CR>', silent = true, remap = false, desc = 'Noice History' },
        { '<leader>oe', '<cmd>Noice errors<CR>', silent = true, remap = false, desc = 'Noice Errors' },
        { '<leader>ol', '<cmd>Noice last<CR>', silent = true, remap = false, desc = 'Noice Last' },
        { '<leader>ot', '<cmd>Noice telescope<CR>', silent = true, remap = false, desc = 'Noice Telescope' },
        { '<leader>od', '<cmd>Noice disable<CR>', silent = true, remap = false, desc = 'Disable Noice' },
        { '<leader>oD', '<cmd>Noice enable<CR>', silent = true, remap = false, desc = 'Enable Noice' },
        {
            '<leader>o<leader>',
            '<cmd>Noice dismiss<CR>',
            silent = true,
            remap = false,
            desc = 'Dismiss all visible messages',
        },
    },

    opts = {

        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        health = {
            checker = false, -- Disable if you don't want health checks to run
        },

        commands = {
            history = {
                view = 'split', -- options for the message history that you get with `:Noice`
            },
            last = {
                view = 'popup', -- :Noice last
            },
            errors = {
                view = 'popup', -- :Noice error
            },
        },
        routes = {
            {
                filter = {
                    -- HIde written message

                    event = 'msg_show',
                    kind = '',
                    find = 'written',
                },
                opts = { skip = true },
            },
        },
        -- USING NOICE FOR LSP STUFF
        lsp = {
            override = {
                -- override the default lsp markdown formatter with Noice
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                -- override the lsp markdown formatter with Noice
                ['vim.lsp.util.stylize_markdown'] = true,
                -- override cmp documentation with Noice (needs the other options to work)
                ['cmp.entry.get_documentation'] = true,
            },
            hover = {
                enabled = false,
                view = nil, -- when nil, use defaults from documentation
                opts = {}, -- merged with defaults from documentation
            },
            signature = {
                enabled = false,
                auto_open = {
                    enabled = false,
                    trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
                    luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
                    throttle = 50, -- Debounce lsp signature help request by 50ms
                },
                view = nil, -- when nil, use defaults from documentation
                opts = {}, -- merged with defaults from documentation
            },
            message = {
                -- Messages shown by lsp servers
                enabled = true,
                view = 'notify',
                opts = {},
            },
            -- defaults for hover and signature help
            documentation = {
                view = 'hover',
                opts = {
                    lang = 'markdown',
                    replace = true,
                    render = 'plain',
                    format = { '{message}' },
                    win_options = { concealcursor = 'n', conceallevel = 3 },
                },
            },
        },
    },
}

vim.keymap.set('c', '<c-j>', '<c-n>')
vim.keymap.set('c', '<c-k>', '<c-p>')

return M
