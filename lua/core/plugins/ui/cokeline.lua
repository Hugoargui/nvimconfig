return {
    enabled = require('core.enable_plugins').cokeline,
    'noib3/nvim-cokeline',
    event = 'VeryLazy',
    config = function()
        local get_hex = require('cokeline/utils').get_hex

        -- TODO: we shouldn't be calling whcihkey from here
        local wk = require('which-key')
        wk.register({
            b = {
                name = 'Buffers',
                g = { '<Plug>(cokeline-pick-focus)', 'Pick Buffer' },
                x = { '<Plug>(cokeline-pick-close)', 'Pick and Close Buffer' },
                -- h = { '<Cmd>BufferLineCloseLeft<Cr>', 'Close Buffers to the Left' },
                -- l = { '<Cmd>BufferLineCloseRight<Cr>', 'Close Buffers to the Right' },
                ['['] = { '<Cmd>(cokeline-switch-prev)<Cr>', 'Move Buffer Left' },
                [']'] = { '<Cmd>(cokeline-switch-next)<Cr>', 'Move Buffer Right' },
                o = { '<Cmd>%bd|e#|bd#<Cr>', 'Close All Other Buffers' },
                b = {
                    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
                    'Buffers',
                },
                q = { '<Cmd>bd<Cr>', 'Delete Current Buffer' },
                -- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
                Q = { '<Cmd>bd!<Cr>', 'Delete Current Buffer (Ignore Unsaved Changes)' },
            },
        }, {
            prefix = '<Leader>',
        })

        -- vim.api.nvim_set_keymap('n', '<Left>', '<Plug>(cokeline-focus-prev)', { noremap = false, silent = true })
        -- vim.api.nvim_set_keymap('n', '<Right>', '<Plug>(cokeline-focus-next)', { noremap = false, silent = true })

        wk.register({
            ['[b'] = { '<Plug>(cokeline-focus-prev)', 'Previous Buffer' },
            [']b'] = { '<Plug>(cokeline-focus-next)', 'Next Buffer' },
        })

        -- vim.api.nvim_set_keymap(k"n", "<space>q", "<Plug>(cokeline-focus-next)", { noremap = false, silent = true })

        local red = vim.g.terminal_color_1
        local green = vim.g.terminal_color_2
        local yellow = vim.g.terminal_color_3
        local is_picking_focus = require('cokeline/mappings').is_picking_focus
        local is_picking_close = require('cokeline/mappings').is_picking_close

        require('cokeline').setup({
            default_hl = {
                fg = function(buffer)
                    if buffer.is_focused then
                        if buffer.is_modified then
                            return get_hex('DiagnosticError', 'bg') -- Highlighted buffer, modified. Light Text red FG
                        else
                            -- return get_hex('IncSearch', 'fg') -- Highlighted buffer, not modified. Grey text, normal bg
                            return get_hex('lualine_a_normal', 'fg') -- Highlighted buffer, not modified. Grey text, normal bg
                        end
                    else
                        if buffer.is_modified then
                            return get_hex('DiagnosticError', 'fg') -- Not Highlighted buffer, modified, red text
                        else
                            return buffer.devicon.color -- Not Highlighted buffer, not modified, normal color
                        end
                    end
                end,
                bg = function(buffer)
                    if buffer.is_focused then
                        if buffer.is_modified then
                            return get_hex('DiagnosticError', 'fg')
                        else
                            -- return get_hex('IncSearch', 'bg')
                            return get_hex('lualine_a_normal', 'bg') -- Highlighted buffer, not modified. Grey text, normal bg
                        end
                    else
                        return get_hex('ColorColumn', 'bg') -- Not focused and not modified, standard background.
                    end
                end,
            },

            sidebar = {
                filetype = 'NvimTree',
                components = {
                    {
                        text = ' File Explorer',
                        fg = get_hex('NvimTreeNormal', 'fg'),
                        bg = get_hex('NvimTreeNormal', 'bg'),
                        style = 'bold',
                    },
                },
            },

            components = {

                -- Show separator between buffertabs:
                {
                    text = function(buffer)
                        if buffer.index ~= 1 then
                            return '▏'
                        else
                            if buffer.is_focused then
                                return ' '
                            else
                                return '│ '
                            end
                        end
                    end,
                    fg = get_hex('Comment', 'fg'),
                },

                -- Create space for the picking letter, otherwise filetype icon
                {
                    text = function(buffer)
                        return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. ' '
                            or buffer.devicon.icon
                    end,
                    fg = function(buffer)
                        return (is_picking_focus() and yellow) or (is_picking_close() and red) --or buffer.devicon.color
                    end,
                    style = function(_)
                        return (is_picking_focus() or is_picking_close()) and 'italic,bold' or nil
                    end,
                },
                -- Show the filename
                {
                    text = function(buffer)
                        return buffer.filename
                    end,
                },

                -- Show circle on modified buffer
                {
                    text = function(buffer)
                        return buffer.is_modified and ' ● ' or ' '
                        -- return buffer.is_modified and ' [+] ' or ' '
                    end,
                },
            },
        })
    end,
}
