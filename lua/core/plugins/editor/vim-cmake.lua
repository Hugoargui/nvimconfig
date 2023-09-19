return {
    {

        -- TOOD: not very lazy, add keys here
        event = 'VeryLazy',
        'cdelledonne/vim-cmake',
        cmd = { 'CMakeGenerate', 'CMakeBuild', 'CMakeClose', 'CMakeClean' },
        config = function()
            vim.keymap.set('n', '<leader>mg', ':CMakeGenerate<cr>', { desc = 'Cmake Generate' })
            vim.keymap.set('n', '<leader>mb', ':CMakeBuild<cr>', { desc = 'Cmake Build' })
            vim.keymap.set('n', '<leader>mq', ':CMakeClose<cr>', { desc = 'Cmake Close' })
            vim.keymap.set('n', '<leader>mc', ':CMakeClean<cr>', { desc = 'Cmake Clean' })
            vim.cmd([[let g:cmake_link_compile_commands = 1]])
        end,
    },
}
