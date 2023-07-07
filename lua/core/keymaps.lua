local keymap = vim.keymap --for conciseness

-- tab management
-- keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
keymap.set('n', '[t', ':tabn<CR>', { desc = 'Previous Tab' }) --  go to next tab
keymap.set('n', ']t', ':tabp<CR>', { desc = 'Next Tab' }) --  go to previous tab

keymap.set('n', '<leader>mg', ':CMakeGenerate<cr>', { desc = 'Cmake Generate' })
keymap.set('n', '<leader>mb', ':CMakeBuild<cr>', { desc = 'Cmake Build' })
keymap.set('n', '<leader>mq', ':CMakeClose<cr>', { desc = 'Cmake Close' })
keymap.set('n', '<leader>mc', ':CMakeClean<cr>', { desc = 'Cmake Clean' })
vim.cmd([[let g:cmake_link_compile_commands = 1]])

-- delete single character without  into register
keymap.set('n', 'x', '"_x')

-- This is a vim builting plugin, it shows up anyways on [] whichkey
-- with the <plug> name, so may as well document it
local wk = require('which-key')
wk.register({
    ['[%'] = 'which_key_ignore',
    [']%'] = 'which_key_ignore',
})

-- Move visual selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- ----------------------------------------------------
vim.keymap.set('n', '<bs>', 'q', { noremap = true })

-- ----------------------------------------------------
-- For the smartword plugin
-- This adds motions, but no text objects, I'll create a custom textobject
vim.keymap.set({ 'n', 'o', 'x' }, 'W', '<Plug>(smartword-w)', { noremap = false, silent = true, desc = 'Surround' })
vim.keymap.set({ 'n', 'o', 'x' }, 'B', '<Plug>(smartword-b)', { noremap = false, silent = true, desc = 'Surround' })
vim.keymap.set({ 'n', 'o', 'x' }, 'E', '<Plug>(smartword-e)', { noremap = false, silent = true, desc = 'Surround' })
vim.keymap.set({ 'n', 'o', 'x' }, 'Q', '<Plug>(smartword-ge)', { noremap = false, silent = true, desc = 'Surround' })

-- For spider casemotion plugin, and skip insignificant puntuation (on by default)
-- This doesnt add text-objects, that's done by the more textobjects plugin
vim.keymap.set({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<CR>", { desc = 'Spider-w' })
vim.keymap.set({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<CR>", { desc = 'Spider-e' })
vim.keymap.set({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<CR>", { desc = 'Spider-b' })
vim.keymap.set({ 'n', 'o', 'x' }, 'q', "<cmd>lua require('spider').motion('ge')<CR>", { desc = 'Spider-ge' })

-- Save like normal people
function Save_file()
    local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable')
    if modifiable then
        vim.cmd('w!')
    end
end
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Cmd>lua Save_file()<CR>', { noremap = true, silent = true })
