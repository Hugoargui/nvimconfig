return {
    {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup({
                close_unsupported_windows = true, -- boolean: Close windows that aren't backed by normal file
                continue_restore_on_error = true,
                log_level = 'error',
                post_cwd_changed_cmds = {
                    function()
                        require('lualine').refresh()
                    end,
                },
                suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
                -- silent_restore = true, -- Suppress extraneous messages and source the whole session, even if there's an error. Set to false to get the line number a restore error

            })

            vim.api.nvim_create_autocmd('VimLeavePre', { pattern = '*', command = 'NvimTreeClose' })
            vim.keymap.set('n', '<leader>xx', '<cmd>SessionSearch<cr>', { desc = 'Search Session' })
            vim.keymap.set('n', '<leader>xs', '<cmd>SessionSave<cr>', { desc = 'Save or Create session' })
            vim.keymap.set('n', '<leader>xd', '<cmd>SearchSession<cr>', { desc = 'Delete Sessions' })
            vim.keymap.set(
                'n',
                '<leader>xc',
                '<cmd>cd %:p:h <cr>',
                { desc = 'Change working directory to the location of the current file' }
            )
        end,
    },
}
