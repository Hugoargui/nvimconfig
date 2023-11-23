return {
    'johmsalas/text-case.nvim',
    enabled = require('core.enable_plugins').text_case,
    keys = {

        { 'ga', desc = 'Caseh Changing' },
        { '<leader>lk' },
    },

    config = function()
        require('textcase').setup({})
        require('telescope').load_extension('textcase')
        vim.api.nvim_set_keymap('n', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'Telescope' })
        vim.api.nvim_set_keymap('v', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'Telescope' })
        vim.api.nvim_set_keymap(
            'n',
            'gaa',
            '<cmd>TextCaseOpenTelescopeQuickChange<CR>',
            { desc = 'Telescope Quick Change' }
        )
        vim.api.nvim_set_keymap(
            'n',
            '<leader>lk',
            '<cmd>TextCaseOpenTelescopeLSPChange<CR>',
            { desc = 'Change Case of Symbol' }
        )
    end,
}
