-- ------------------------------------------------
-- Visual mode mappings
-- ------------------------------------------------
-- Move visual selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- ------------------------------------------------
-- Normal mode mappings
-- ------------------------------------------------
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'L', '$', { desc = 'To end of line' })
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'H', '^', { desc = 'To beginning of line' })

vim.keymap.set('n', 'U', '<c-r>', { noremap = true })
-- ----------------------------------------------------
vim.keymap.set('n', '<bs>', 'q', { noremap = true })

-- Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
vim.keymap.set('n', '<A-j>', 'mojdd`o') -- Delete line bellow
vim.keymap.set('n', '<A-k>', 'mokdd`o') -- Delete line above
vim.keymap.set('n', '<C-j>', 'moo<Esc>0"_D`o') -- Add line bellow, 0"_D is for whitespace in edge cases
vim.keymap.set('n', '<C-k>', 'moO<Esc>0"_D`o') -- Add line bellow, 0"_D is for whitespace in edge cases:

-- close current win if there are more than 1 win
-- else close current tab if there are more than 1 tab
-- else close current vim
function SmartQuit()
    if #vim.api.nvim_tabpage_list_wins(0) > 1 then
        vim.cmd([[close]])
    elseif #vim.api.nvim_list_tabpages() > 1 then
        vim.cmd([[tabclose]])
    else
        vim.cmd([[qa]])
    end
end
vim.keymap.set('n', '<C-q>', SmartQuit, { desc = 'smart quit' })

-- Save like normal people
function SaveFile()
    local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable')
    if modifiable then
        vim.cmd('w!')
    end
end
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', SaveFile, { noremap = true, silent = true })

-- SPELLING MAPPINGS
vim.keymap.set('n', '<leader>zz', function()
    require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))
    vim.opt.spell = true
end, { desc = '  Spelling Suggestions' })
vim.keymap.set('n', '<leader>zn', ']s', { desc = '  Next spelling error' })
vim.keymap.set('n', '<leader>zp', '[s', { desc = '  Previous spelling error' })
vim.keymap.set('n', '<leader>zg', 'zg', { desc = ' Good: add word to dictionary' })

-- ------------------------------------------------
-- Insert mode readline mappings
-- ------------------------------------------------
-- Lines bellow/above
vim.keymap.set('i', '<A-o>', '<Esc>o') -- LINE BELLOW
vim.keymap.set('i', '<A-O>', '<Esc>O') -- LINE ABOVE

-- MOVEMENT
vim.keymap.set('i', '<C-b>', '<Left>') -- ONE CHAR BACK
vim.keymap.set('i', '<A-b>', '<C-o>b') -- ONE wORD BACK

vim.keymap.set('i', '<C-f>', '<Right>') -- ONE CHAR FRONT
vim.keymap.set('i', '<A-f>', '<C-o>w') -- ONE WORD FRONT

vim.keymap.set('i', '<C-a>', '<HOME>') -- GO TO BEGINNING OF LINE
vim.keymap.set('i', '<C-e>', '<END>') -- GO TO END OF LINE

-- KILL
vim.keymap.set('i', '<C-h>', '<BS>') -- Delete one character back
vim.keymap.set('i', '<M-h>', '<C-o>db') -- Delete one word back
vim.keymap.set('i', '<M-BS>', '<C-o>db') -- Delete one word back

vim.keymap.set('i', '<C-d>', '<Del>') -- Delete one character front
vim.keymap.set('i', '<M-d>', '<C-o>dw') -- Delete one character front

vim.keymap.set('i', '<C-k>', '<C-o>d$') -- DELETE TO END OF LINE
vim.keymap.set('i', '<C-u>', '<C-o>d^') -- DELETE TO BEGINING OF LINE
vim.keymap.set('i', '<M-l>', '<C-o>dd') -- delete current line

-- TODO: <c-d> removes one level of indentation, maybe remap to <c-<>
-- TODO: <c-t> adds one level of indentation, maybe remap to <c->>

vim.keymap.set('i', '<M-d>', '<esc>yypgi') -- Duplicate current line bellow

-- SET UNDO POINTS SO UNDO COMMAND DOESN'T DELETE WHOLE TEXT
vim.keymap.set('i', '.', '.<C-g>u')
vim.keymap.set('i', '!', '!<C-g>u')
vim.keymap.set('i', '?', '?<C-g>u')
vim.keymap.set('i', ':', ':<C-g>u')
vim.keymap.set('i', ';', ';<C-g>u')

-- ------------------------------------------------
-- COMMAND LINE COMMANDS
-- ------------------------------------------------
vim.keymap.set('c', '<c-j>', '<c-n>')
vim.keymap.set('c', '<c-k>', '<c-p>')
vim.keymap.set('c', '<A-h>', '<C-w>')
