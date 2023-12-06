-- TODO: think about a more powerfull plugin like other.nvim... or get builting clangd working

return {
    'jakemason/ouroboros',
    enabled = require('core.enable_plugins').ouroboros,
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    ft = { 'cpp', 'c' },
    config = function()
        local wk_enabled = require('core.enable_plugins').whichkey
        if wk_enabled then
            local wkl = require('which-key')
            vim.cmd('autocmd FileType cpp lua RegisterOuroborosKeymaps()')
            function RegisterOuroborosKeymaps()
                wkl.register({
                    name = '   CPP specific options',
                    ['a'] = { '<cmd>Ouroboros<CR>', ' in place ALTERNATE FILE' },
                    ['v'] = { '<cmd>vsplit | Ouroboros<CR>', ' Vertical ALTERNATE FILE' },
                    ['h'] = { '<cmd>split | Ouroboros<CR>', ' Horizontal ALTERNATE FILE' },
                }, { prefix = '<leader>a', buffer = 0 })
            end
        else
            vim.keymap.set('n', '<leader>aa', '<cmd>Ouroboros<CR>', { desc = ' in place ALTERNATE FILE' })
            vim.keymap.set('n', '<leader>av', '<cmd>vsplit | Ouroboros<CR>', { desc = ' Vertical ALTERNATE FILE' })
            vim.keymap.set('n', '<leader>ah', '<cmd>split | Ouroboros<CR>', { desc = ' Horizontal ALTERNATE FILE' })
        end
    end,
}
