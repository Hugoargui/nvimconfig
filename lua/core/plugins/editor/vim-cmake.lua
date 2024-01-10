return {
    {
        'cdelledonne/vim-cmake',
        -- TODO: Not able to install anymore, replace by more modern plugin
        -- enabled = require('core.enable_plugins').vim_cmake,
        enabled = false,
        -- TODO: not very lazy, add keys here
        event = 'VeryLazy',
        cmd = { 'CMakeGenerate', 'CMakeBuild', 'CMakeClose', 'CMakeClean' },
        config = function()
            vim.keymap.set('n', '<leader>mg', ':CMakeGenerate<cr>', { desc = ' Cmake Generate' })
            vim.keymap.set('n', '<leader>mb', ':CMakeBuild<cr>', { desc = ' Cmake Build' })
            vim.keymap.set('n', '<leader>mq', ':CMakeClose<cr>', { desc = ' Cmake Close' })
            vim.keymap.set('n', '<leader>mc', ':CMakeClean<cr>', { desc = '∅ Cmake Clean' })
            vim.cmd([[let g:cmake_link_compile_commands = 1]])
        end,
    },
}
