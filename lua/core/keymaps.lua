-- Visual mode mappings
-- ------------------------------------------------
-- Move visual selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- ------------------------------------------------
-- Normal mode mappings
-- ------------------------------------------------
-- Smart go to first char in line:
local function jump_to_line_start()
    local col = vim.fn.col '.'
    local first_non_blank = vim.fn.indent(vim.fn.line '.') + 1
    if col == first_non_blank then
        return '0' -- Jump to the beginning of the line
    else
        return '^' -- Jump to the first non-blank character
    end
end

vim.keymap.set({ 'n', 'v', 'o' }, 'H', function()
    return jump_to_line_start()
end, { noremap = true, expr = true, desc = 'To beginning of line' })

-- vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'H', '^', { desc = 'To beginning of line' })
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'L', '$', { desc = 'To end of line' })

vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'J', 'J', { desc = 'Join line' })
vim.keymap.set({ 'n', 'x', 'v', 'o' }, 'K', 'i<CR><ESC>', { desc = 'Split line' })

vim.keymap.set('n', 'U', '<c-r>', { noremap = true })

-- backspace to toggle between current/previous buffer
vim.keymap.set('n', '<bs>', '<c-^>\'”zz', { silent = true, noremap = true })

vim.keymap.set({ 'n' }, '<leader>qq', '<cmd>q<CR>', { desc = '"q  " ->  Quit this if no changes' })
vim.keymap.set({ 'n' }, '<leader>qa', '<cmd>qa<CR>', { desc = '"qa " ->  Quit all if no changes' })
vim.keymap.set({ 'n' }, '<leader>qQ', '<cmd>q!<CR>', { desc = '"q! " ->  Quit this without saving' })
vim.keymap.set({ 'n' }, '<leader>qA', '<cmd>qa!<CR>', { desc = '"qa!" ->  Quit all without saving' })
vim.keymap.set({ 'n' }, '<leader>qw', '<cmd>wq<CR>', { desc = '"wq " ->  Save this and quit' })
vim.keymap.set({ 'n' }, '<leader>qW', '<cmd>wqa<CR>', { desc = '"wqa" ->  Save all and quit' })

-- "p" makes sense, gv selects the last Visual selection, so this one selects the last pasted text.
vim.keymap.set({ 'n' }, 'gp',
    function()
        vim.api.nvim_feedkeys("`[" .. vim.fn.strpart(vim.fn.getregtype(), 0, 1) .. "`]", "n", false)
    end,
    { desc = "GOTO last paste" }
)

vim.keymap.set("n", "yc", "yygccp", { remap = true, desc = "[P]aste to a comment above" })
vim.keymap.set("v", "<C-p>", "ygvgc`>p", { remap = true, desc = "[P]aste to a comment above" })

-- ----------------------------------------------------
-- find a better mapping, it fucks up reference window
-- vim.keymap.set('n', '<CR>', '@q', { noremap = true })
-- vim.keymap.set('n', '<C-CR>', 'qq', { noremap = true })

-- LINE MOVING MAPPINGS    -- Add empty lines before and after cursor line
vim.keymap.set('n', 'gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
    { desc = 'Put empty line above' })
vim.keymap.set('n', 'go', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
    { desc = 'Put empty line below' })
-- vim.keymap.set('n', '<C-j>', 'mojdd`o', { desc = 'Delete line Above' })
-- vim.keymap.set('n', '<C-k>', 'mokdd`o', { desc = 'Delete line Bellow' })

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

-- NAVIGATE INDENTATION LEVELS:
-- TODO: make working
-- https://old.reddit.com/r/neovim/comments/16aan6k/my_latest_favorite_mapping_share_yours/
-- local function indent_traverse(direction, equal)
-- return function() -- Get the current cursor position
--     local current_line, column = unpack(vim.api.nvim_win_get_cursor(0))
--     local match_line = current_line
--     local match_indent = false
--     local match = false
--     local buf_length = vim.api.nvim_buf_line_count(0)
--
--     -- Look for a line of appropriate indent
--     -- level without going out of the buffer
--     while (not match)
--         and (match_line ~= buf_length)
--         and (match_line ~= 1)
--     do
--         match_line = match_line + direction
--         local match_line_str = vim.api.nvim_buf_get_lines(0, match_line - 1, match_line, false)[1]
--         -- local match_line_is_whitespace = match_line_str and match_line_str:match('^%s*$')
--         local match_line_is_whitespace = match_line_str:match('^%s*$')
--
--         if equal then
--             match_indent = vim.fn.indent(match_line) <= vim.fn.indent(current_line)
--         else
--             match_indent = vim.fn.indent(match_line) < vim.fn.indent(current_line)
--         end
--         match = match_indent and not match_line_is_whitespace
--     end
--
--     -- If a line is found go to line
--     if match or match_line == buf_length then
--         vim.fn.cursor({ match_line, column + 1 })
--     end
-- end
-- end

-- vim.keymap.set({ 'n', 'v' }, "gj", indent_traverse(1, true))   -- next equal indent
-- vim.keymap.set({ 'n', 'v' }, 'gk', indent_traverse(-1, true))  -- previous equal indent
-- vim.keymap.set({ 'n', 'v' }, 'gJ', indent_traverse(1, false))  -- next equal indent
-- vim.keymap.set({ 'n', 'v' }, 'gK', indent_traverse(-1, false)) -- previous equal indent


-- Window management keymaps

-- moving between splits
if require('core.enable_plugins').smart_splits then
    vim.keymap.set('n', '<C-A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<C-A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<C-A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<C-A-l>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right)
    -- swapping buffers between windows
    -- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    -- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    -- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    -- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
else
    vim.keymap.set('n', '<A-h>', '<C-w>h')
    vim.keymap.set('n', '<A-w>', '<C-w>j')
    vim.keymap.set('n', '<A-k>', '<C-w>k')
    vim.keymap.set('n', '<A-l>', '<C-w>l')
end

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

vim.keymap.set('i', '<C-o>', '<Esc>o')               -- Add line bellow and move to it
vim.keymap.set('i', '<C-O>', '<Esc>O')               -- Add line above and move to it
vim.keymap.set('i', '<A-o>', '<Esc>moo<Esc>0"_D`oa') -- Add line bellow without moving cursor
vim.keymap.set('i', '<A-O>', '<Esc>moO<Esc>0"_D`oa') -- Add line above without moving cursor

-- MOVEMENT
vim.keymap.set('i', '<C-b>', '<Left>')  -- ONE CHAR BACK
vim.keymap.set('i', '<A-b>', '<C-o>b')  -- ONE wORD BACK

vim.keymap.set('i', '<C-f>', '<Right>') -- ONE CHAR FRONT
vim.keymap.set('i', '<A-f>', '<C-o>w')  -- ONE WORD FRONT

vim.keymap.set('i', '<C-a>', '<HOME>')  -- GO TO BEGINNING OF LINE
vim.keymap.set('i', '<C-e>', '<END>')   -- GO TO END OF LINE

-- KILL
vim.keymap.set('i', '<C-h>', '<BS>')     -- Delete one character back
vim.keymap.set('i', '<M-h>', '<C-o>db')  -- Delete one word back
vim.keymap.set('i', '<M-BS>', '<C-o>db') -- Delete one word back

vim.keymap.set('i', '<C-d>', '<Del>')    -- Delete one character front
vim.keymap.set('i', '<M-d>', '<C-o>dw')  -- Delete one character front

vim.keymap.set('i', '<C-k>', '<C-o>d$')  -- DELETE TO END OF LINE
vim.keymap.set('i', '<C-u>', '<C-o>d^')  -- DELETE TO BEGINING OF LINE
vim.keymap.set('i', '<M-l>', '<C-o>dd')  -- delete current line

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
