return {
    'danielfalk/smart-open.nvim',
    branch = '0.2.x',
    -- TODO: lazy load on keys or commands
    config = function()
        require('telescope').load_extension('smart_open')
        vim.keymap.set('n', '<leader>f', function()
            require('telescope').extensions.smart_open.smart_open({
                cwd_only = true,
                filename_first = false,
                layout_config = {
                    horizontal = { prompt_position = 'top' },
                    width = 100,
                    height = 40,
                },
                previewer = false,
            })
        end, { noremap = true, silent = true, desc = '  Find files' })
        vim.keymap.set('n', '<leader>F', function()
            require('telescope').extensions.smart_open.smart_open({
                cwd_only = true,
                filename_first = false,
            })
        end, { noremap = true, silent = true, desc = '  Find Files with preview' })
    end,
    dependencies = {
        'kkharji/sqlite.lua',
        -- Only required if using match_algorithm fzf
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
        { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
}
