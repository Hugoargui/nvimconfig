local keymap = vim.keymap --for conciseness

-- Move visual selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'L', '$', { desc = 'To end of line' })
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'H', '^', { desc = 'To begining of line' })

vim.keymap.set('n', 'U', '<c-r>', { noremap = true })
-- ----------------------------------------------------
vim.keymap.set('n', '<bs>', 'q', { noremap = true })

-- Save like normal people
function Save_file()
    local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable')
    if modifiable then
        vim.cmd('w!')
    end
end
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Cmd>lua Save_file()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>z', function()
    require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))
end, { desc = 'Spelling Suggestions' })
