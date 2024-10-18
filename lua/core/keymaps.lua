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
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'J', 'J', { desc = 'Join line' })
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'K', 'i<CR><ESC>', { desc = 'Split line' })

vim.keymap.set('n', 'U', '<c-r>', { noremap = true })

vim.keymap.set({ 'n' }, '<leader>qq', '<cmd>q<CR>', { desc = '"q  " ->  Quit this if no changes' })
vim.keymap.set({ 'n' }, '<leader>qa', '<cmd>qa<CR>', { desc = '"qa " ->  Quit all if no changes' })
vim.keymap.set({ 'n' }, '<leader>qQ', '<cmd>q!<CR>', { desc = '"q! " ->  Quit this without saving' })
vim.keymap.set({ 'n' }, '<leader>qA', '<cmd>qa!<CR>', { desc = '"qa!" ->  Quit all without saving' })
vim.keymap.set({ 'n' }, '<leader>qw', '<cmd>wq<CR>', { desc = '"wq " ->  Save this and quit' })
vim.keymap.set({ 'n' }, '<leader>qW', '<cmd>wqa<CR>', { desc = '"wqa" ->  Save all and quit' })

-- ----------------------------------------------------
vim.keymap.set('n', '<CR>', '@q', { noremap = true })
vim.keymap.set('n', '<C-CR>', 'qq', { noremap = true })

-- Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
vim.keymap.set('n', '<C-j>', 'mojdd`o', { desc = 'Delete line Above' })
vim.keymap.set('n', '<C-k>', 'mokdd`o', { desc = 'Delete line Bellow' })
-- 0"_D is for whitespace in edge cases
vim.keymap.set('n', '<M-j>', 'moo<Esc>0"_D`o', { desc = 'Add line Above' })
vim.keymap.set('n', '<M-k>', 'moO<Esc>0"_D`o', { desc = 'Add line Bellow' })

-- Toggle characters at end of line!
local matchLastChar = '<cmd>s/\\v(.)$'
local ternaryConditionOnMatch = '\\=submatch(1)=='
vim.keymap.set(
    'n',
    '<A-;>',
    'mo' .. matchLastChar .. '/' .. ternaryConditionOnMatch .. "';'" .. "?'':submatch(1).';'<CR>" .. '`o'
) -- toggle end of line ';'
vim.keymap.set(
    'n',
    '<A-,>',
    'mo' .. matchLastChar .. '/' .. ternaryConditionOnMatch .. "','" .. "?'':submatch(1).','<CR>" .. '`o'
) -- toggle end of line ','
vim.keymap.set(
    'i',
    '<A-;>',
    '<esc>mo' .. matchLastChar .. '/' .. ternaryConditionOnMatch .. "';'" .. "?'':submatch(1).';'<CR>" .. '`oi'
) -- toggle end of line ';'
vim.keymap.set(
    'i',
    '<A-,>',
    '<esc>mo' .. matchLastChar .. '/' .. ternaryConditionOnMatch .. "','" .. "?'':submatch(1).','<CR>" .. '`oi'
) -- toggle end of line ','

-- Folds mappings
if require('core.enable_plugins').ufo then
    vim.keymap.set('n', 'za', 'za', { desc = '  Toggle fold under cursor' })
    vim.keymap.set('n', 'zA', 'zA', { desc = '  Toggle all folds under cursor ' })
    vim.keymap.set('n', 'zc', 'zc', { desc = '  Close fold under cursor ' })
    vim.keymap.set('n', 'zC', 'zC', { desc = '  Close all folds under cursor ' })
    vim.keymap.set('n', 'zo', 'zo', { desc = '  Open fold under cursor' })
    vim.keymap.set('n', 'zO', 'zO', { desc = '  Open all folds under cursor ' })
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = '  Open all folds in document' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = '  Close all folds in document' })
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = '  Decrease fold level' })
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = '  Increase fold level' }) -- closeAllFolds == closeFoldsWith(0)
else
    vim.keymap.set('n', 'za', 'za', { desc = 'Toggle fold under cursor' })
    vim.keymap.set('n', 'zA', 'zA', { desc = 'Toggle all folds under cursor' })
    vim.keymap.set('n', 'zc', 'zc', { desc = 'Close fold under cursor' })
    vim.keymap.set('n', 'zC', 'zC', { desc = 'Close all folds under cursor' })
    vim.keymap.set('n', 'zo', 'zo', { desc = 'Open fold under cursor' })
    vim.keymap.set('n', 'zO', 'zO', { desc = 'Open all folds under cursor' })
    vim.keymap.set('n', 'zR', 'zR', { desc = 'Open all folds in document' })
    vim.keymap.set('n', 'zM', 'zM', { desc = 'Close all folds in document' })
    vim.keymap.set('n', 'zr', 'zr', { desc = 'Decrease fold level' })
    vim.keymap.set('n', 'zm', 'zm', { desc = 'Increase fold level' })
end

-- Window management keymaps
vim.keymap.set('n', '<leader>wv', '<c-w>v<cr>', { desc = ' Split vertically' })
vim.keymap.set('n', '<leader>wh', '<C-w>s>', { desc = ' Split horizontally' })
vim.keymap.set('n', '<leader>we', '<C-w> =<CR>', { desc = ' Make splits equal size' })
vim.keymap.set('n', '<leader>wq', '<cmd>close<CR>', { desc = '󰅗 Close current window' })
vim.keymap.set('n', '<leader>wo', '<cmd>only<CR>', { desc = ' Close all other windows' })
vim.keymap.set('n', '<leader>wz', '<cmd>MaximizerToggle<CR>', { desc = ' Window Zoom' })

-- close current win if there are more than 1 win
-- else close current tab if there are more than 1 tab;
-- else close current vim
local function SmartQuit()
    if #vim.api.nvim_tabpage_list_wins(0) > 1 then
        vim.cmd([[close]])
    elseif #vim.api.nvim_list_tabpages() > 1 then
        vim.cmd([[tabclose]])
    else
        vim.cmd([[qa]])
    end
end
vim.keymap.set('n', '<C-q>', SmartQuit, { desc = 'smart quit' })

-- save like normal people
local function SaveFile()
    -- local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable') -- deprecated, use nvim_get_option_value()
    local modifiable = true
    if modifiable then
        vim.cmd('w!')
    end
end
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', SaveFile, { noremap = true, silent = true })

-- SPELLING MAPPINGS
if require('core.enable_plugins').telescope then
    vim.keymap.set('n', '<leader>zz', function()
        require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))
        vim.opt.spell = true
    end, { desc = '   Spelling Suggestions' })
end
vim.keymap.set('n', '<leader>zn', ']s', { desc = '  Next spelling error' })
vim.keymap.set('n', '<leader>zp', '[s', { desc = '  Previous spelling error' })
vim.keymap.set('n', '<leader>zg', 'zg', { desc = '  Good: add word to dictionary' })

-- Git
if require('core.enable_plugins').telescope then
    vim.keymap.set('n', '<leader>go', '<cmd>Telescope git_status<cr>', { desc = ' Open changed file' })
    vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = ' Checkout branch' })
    vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = ' Checkout commit' })
end
-- ------------------------------------------------
-- Insert mode readline mappings
-- ------------------------------------------------

vim.keymap.set('i', '<C-q>', '<C-o>') -- Make one normal mode move and return to insert mode

-- Insert Lines bellow/above while staying in insert mode

vim.keymap.set('i', '<C-o>', '<Esc>o') -- Add line bellow and move to it
vim.keymap.set('i', '<C-O>', '<Esc>O') -- Add line above and move to it
vim.keymap.set('i', '<A-o>', '<Esc>moo<Esc>0"_D`oa') -- Add line bellow without moving cursor
vim.keymap.set('i', '<A-O>', '<Esc>moO<Esc>0"_D`oa') -- Add line above without moving cursor

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
vim.keymap.set('c', '<c-j>', '<c-n>') -- Navigate command line like I do Telescope
vim.keymap.set('c', '<c-k>', '<c-p>') -- Navigate command line like I do Telescope
vim.keymap.set('c', '<A-h>', '<C-w>') -- otherwise I get used to C-w and close the browser all the time
