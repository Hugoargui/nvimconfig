local keymap = vim.keymap --for conciseness

-- tab management
-- keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
keymap.set('n', '[t', ':tabn<CR>', { desc = 'Previous Tab' }) --  go to next tab
keymap.set('n', ']t', ':tabp<CR>', { desc = 'Next Tab' }) --  go to previous tab

-- keymap.set('n', 'x', '"_x')

-- Move visual selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

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
