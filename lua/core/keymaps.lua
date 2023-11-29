local keymap = vim.keymap --for conciseness

-- Move visual selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'L', '$', { desc = 'To end of line' })
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'H', '^', { desc = 'To beginning of line' })

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
end, { desc = '  Spelling Suggestions' })

-- ------------------------------------------------
-- Insert mode readline mappings
-- ------------------------------------------------

-- Lines bellow/above
vim.keymap.set('!', '<M-o>', '<Esc>o') -- LINE BELLOW
vim.keymap.set('!', '<M-O>', '<Esc>O') -- LINE ABOVE

-- MOVEMENT
vim.keymap.set('!', '<C-b>', '<Left>') -- ONE CHAR BACK
vim.keymap.set('!', '<M-b>', '<C-o>b') -- ONE wORD BACK

vim.keymap.set('!', '<C-f>', '<Right>') -- ONE CHAR FRONT
vim.keymap.set('!', '<M-f>', '<C-o>w') -- ONE WORD FRONT

vim.keymap.set('!', '<C-a>', '<ESC>I') -- GO TO BEGINNING OF LINE
vim.keymap.set('!', '<C-e>', '<ESC>A') -- GO TO END OF LINE

-- KILL
vim.keymap.set('!', '<C-h>', '<BS>') -- Delete one character back
vim.keymap.set('!', '<M-h>', '<C-o>db') -- Delete one word back
vim.keymap.set('!', '<M-BS>', '<C-o>db') -- Delete one word back
vim.keymap.set('!', '<C-d>', '<Del>') -- Delete one character front
vim.keymap.set('!', '<M-d>', '<C-o>dw') -- Delete one character front

vim.keymap.set('!', '<C-k>', '<C-o>d$') -- DELETE TO END OF LINE
vim.keymap.set('!', '<C-u>', '<C-o>d^') -- DELETE TO BEGINING OF LINE
vim.keymap.set('!', '<M-l>', '<C-o>dd') -- delete current line

-- TODO: <c-d> removes one level of indentation, mayb emap to <c-<>
-- TODO: <c-t> adds one level of indentation, mayb emap to <c->>

vim.keymap.set('!', '<M-d>', '<esc>yypgi') -- Duplicate current line bellow
