return {
    'AckslD/nvim-FeMaco.lua',
    ft = 'markdown',
    config = function()
        require('femaco').setup()
        local wk_enabled = require('core.enable_plugins').whichkey
        if wk_enabled then
            local wkl = require('which-key')
            vim.cmd('autocmd FileType markdown lua RegisterFemacoKeymap()')
            function RegisterFemacoKeymap()
                wkl.register({
                    name = '   Markdown specific actions',
                    ['f'] = { '<cmd>FeMaco<CR>', ' Edit Code Block in floating-window' },
                }, { prefix = '<leader>a', buffer = 0 })
            end
        else
            vim.keymap.set('n', '<leader>af', '<cmd>FeMaco<CR>', ' Edit Code Block in floating-window')
        end
    end,
}
