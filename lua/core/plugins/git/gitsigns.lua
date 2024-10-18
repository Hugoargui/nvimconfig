return {
    'lewis6991/gitsigns.nvim',
    enabled = require('core.enable_plugins').gitsigns,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        local gitsigns = require('gitsigns')

        gitsigns.setup({
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 50,
                ignore_whitespace = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%d-%m-%Y> - <summary>',
            signs = {
                add = { text = '│' },
                change = { text = '│' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            -- attach_to_untracked = false,
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'rounded',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1,
            },
        })

        vim.keymap.set({ 'n' }, '<leader>gj', "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = '➡ Next Hunk' })
        vim.keymap.set({ 'n' }, '<leader>gk', "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = '⬅ Prev Hunk' })
        vim.keymap.set(
            { 'n' },
            '<leader>gl',
            "<cmd>lua require 'gitsigns'.blame_line()<cr>",
            { desc = ' Blame Line Hover' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>gL',
            "<cmd>lua require 'gitsigns'toggle_current_line_blame()<cr>",
            { desc = '↴ Toggle Blame Line' }
        )
        -- vim.keymap.set(
        --     { 'n' },
        --     '<leader>gw',
        --     "<cmd>lua require 'gitsigns'toggle_word_diff()<cr>",
        --     { desc = ' Toggle Word Diff' }
        -- )
        vim.keymap.set(
            { 'n' },
            '<leader>gp',
            "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
            { desc = ' Preview Hunk' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>gr',
            "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
            { desc = 'ﰸ Reset Hunk' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>gR',
            "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
            { desc = ' Reset Buffer' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>gs',
            "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
            { desc = ' Stage Hunk' }
        )
        vim.keymap.set(
            { 'n' },
            '<leader>gu',
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            { desc = ' Undo Stage Hunk' }
        )
        vim.keymap.set({ 'n' }, '<leader>gd', '<cmd>Gitsigns diffthis HEAD<cr>', { desc = '➡ Next Hunk' })
    end,
}
