return {
    'AntonVanAssche/md-headers.nvim',
    enabled = require('core.enable_plugins').md_headers,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    ft = 'markdown',
    config = function()
        require('md-headers').setup({
            width = 150,
            height = 50,
            borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        })

        local wk_enabled = require('core.enable_plugins').whichkey
        if wk_enabled then
            local wkl = require('which-key')

            vim.cmd('autocmd FileType markdown lua RegisterHeaderKeymap()')
            function RegisterHeaderKeymap()
                wkl.register({
                    name = '   Markdown specific actions',
                    ['a'] = { '<cmd>MarkdownHeadersClosest<CR>', '⛵Navigate Markdown Headers' },
                }, { prefix = '<leader>a', buffer = 0 })
            end
        else
            vim.keymap.set('n', '<leader>aa', '<cmd>MarkdownHeadersClosest<CR>', '⛵Navigate Markdown Headers')
        end
    end,
}
