return {
    'folke/trouble.nvim',
    -- enabled = require('core.enable_plugins').trouble,
    enabled = true,
    opts = {},
    cmd = "Trouble",
    keys = {
        { '<leader>tt', '<cmd>Trouble lsp toggle<CR>',                         { desc = 'Trouble LSP' } },
        { '<leader>tr', '<cmd>Trouble lsp_references toggle<CR>',              { desc = 'Trouble References' } },

        { '<leader>ts', '<cmd>Trouble symbols toggle win.position=bottom<CR>', { desc = 'Trouble Symbols' } },
        { '<leader>to', '<cmd>Trouble symbols toggle win.position=rightCR>',   { desc = 'Trouble Symbols Right' } },

        { '<leader>td', '<cmd>Trouble diagnostics toggle<CR>',                 { desc = 'Trouble Workspace Diagnostics' } },
        { '<leader>tD', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',    { desc = 'Trouble Document Diagnostics' } },

        { '<leader>tq', '<cmd>Trouble qflist toggle<CR>',                      { desc = 'Trouble QuickFix' } },
        { '<leader>tl', '<cmd>Trouble loclist toggle<CR>',                     { desc = 'Trouble LocList' } },
    },
}
