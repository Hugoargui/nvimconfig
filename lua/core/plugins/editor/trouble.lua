return {
    'folke/trouble.nvim',
    enabled = require('core.enable_plugins').trouble,
    config = true,
    keys = {
        { '<leader>tt', '<cmd>TroubleToggle<CR>', { desc = 'Trouble Toggle' } },
        { '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<CR>', { desc = 'Trouble Workspace Diagnostics' } },
        { '<leader>td', '<cmd>TroubleToggle document_diagnostics<CR>', { desc = 'Trouble Document Diagnostics' } },
        { '<leader>tq', '<cmd>TroubleToggle quickfix<CR>', { desc = 'Trouble QuickFix' } },
        { '<leader>tl', '<cmd>TroubleToggle loclist<CR>', { desc = 'Trouble LocList' } },
    },
}
