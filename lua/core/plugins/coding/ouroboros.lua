-- TODO: think about a more powerfull plugin like other.nvim... or get builting clangd working

return {
    'jakemason/ouroboros',
    enabled = require('core.enable_plugins').ouroboros,
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    ft = { 'cpp', 'c' },
    config = function()
        vim.keymap.set('n', '<leader>+a', '<cmd>Ouroboros<CR>', { desc = ' in place ALTERNATE FILE' })
        vim.keymap.set('n', '<leader>+v', '<cmd>vsplit | Ouroboros<CR>', { desc = ' Vertical ALTERNATE FILE' })
        vim.keymap.set('n', '<leader>+h', '<cmd>split | Ouroboros<CR>', { desc = ' Horizontal ALTERNATE FILE' })
    end,
}
