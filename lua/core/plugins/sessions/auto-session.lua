return {
    {
        'rmagatti/auto-session',
        dependencies = { 'rmagatti/session-lens' },
        config = function()
            require('auto-session').setup({
                log_level = 'error',
                auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            })

            vim.api.nvim_create_autocmd('VimLeavePre', { pattern = '*', command = 'NvimTreeClose' })
        end,
    },
    {
        'rmagatti/session-lens',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('session-lens').setup({
                auto_restore_enabled = true,
            })
            vim.keymap.set('n', '<leader>xx', '<cmd>SearchSession<cr>', { desc = 'Search Session' })
            vim.keymap.set('n', '<leader>xs', '<cmd>SessionSave<cr>', { desc = 'Save or Create session' })
            vim.keymap.set('n', '<leader>xd', '<cmd>SearchSession<cr>', { desc = 'Delete Sessions' })
            vim.keymap.set('n', '<leader>xc', '<cmd>cd %:p:h <cr>', { desc = 'Change working directory to the location of the current file' })
        end,
    },
}
