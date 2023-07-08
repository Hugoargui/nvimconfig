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
        end,
    },
}
