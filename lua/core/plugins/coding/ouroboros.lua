-- TODO: think about a more powerfull plugin like other.nvim... or get builting clangd working

return {
    'jakemason/ouroboros',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    ft = { 'cpp', 'c' },
    config = function()
        vim.keymap.set('n', '<leader>aa', '<cmd>Ouroboros<CR>', { desc = 'GO TO Alternate File' })
        vim.keymap.set('n', '<leader>av', '<cmd>vsplit | Ouroboros<CR>', { desc = 'GO TO Alternate File' })
        vim.keymap.set('n', '<leader>ah', '<cmd>split | Ouroboros<CR>', { desc = 'GO TO Alternate File' })
    end,
}
