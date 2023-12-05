local keymap = vim.keymap -- for conciseness
local native = vim.lsp.buf -- for conciseness
local nativediag = vim.diagnostic -- for conciseness

-- TODO: maybe pass {buffer=0} to keymaps set so mappings only apply to current buffer that has LSP attached
-- See TJdevies Neovim Builtin LSP Setup GUide around minute 31 for more info

vim.keymap.set({ 'n' }, '<C-k>', function()
    require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

-- ------------------------------------------------------------------------------------------------------------
-- GO TO DEFINITION
keymap.set('n', 'gd', native.definition, { desc = 'GO TO Definition' }) -- go to definition

-- PPEK DEFINITION
keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', { desc = 'Peek Definition' }) -- peek definition and make edits in window

-- GO TO DECLARATION
keymap.set('n', 'gD', native.declaration, { desc = 'GO TO Declaration' }) -- got to declaration

-- GO TO REFERENCES
keymap.set('n', 'gr', native.references, { desc = 'GO TO References' }) -- go to definition

-- GO TO IMPLEMENTATION
keymap.set('n', 'gI', native.implementation, { desc = 'GO TO Implementation' }) -- go to implementation

-- GO TO IMPLEMENTATION
keymap.set('n', 'gt', native.type_definition, { desc = 'GO TO Type' }) -- go to type definition

-- ------------------------------------------------------------------------------------------------------------
keymap.set('n', '<leader>lf', 'native.format{async=true}', { desc = 'ﯔ Auto-Format' }) -- see available code actions

-- ------------------------------------------------------------------------------------------------------------
-- LSP OUTLINE
-- keymap.set('n', '<leader>lx', '<cmd>Lspsaga outline<CR>', { desc = 'Toggle Outline' }) -- see outline on right hand side
-- FIXME: why can't i set <leader>ll for this?
-- It does nothing, and when I search keymap with telescope I see an empty keymap
SymbolsOutlineEnabled = require('core.enable_plugins').symbols_outline
if SymbolsOutlineEnabled then
    keymap.set('n', '<leader>le', '<cmd>SymbolsOutline<CR>', { desc = 'ﯻ Toggle Symbol Explorer' }) -- see outline on right hand side
end

-- LSP SEARCH SYMBOLS
keymap.set('n', '<leader>ld', '<cmd>Telescope lsp_document_symbols<CR>', { desc = ' Document Symbols' })
keymap.set('n', '<leader>lw', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { desc = '冷 Workspace Symbols' })
-- stopped working
-- keymap.set('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<CR>', { desc = 'LSP finder' }) -- show definition, references

-- Call hierarchy
keymap.set('n', '<Leader>li', '<cmd>Lspsaga incoming_calls<CR>', { desc = '↳ Incoming Calls' })
keymap.set('n', '<Leader>lo', '<cmd>Lspsaga outgoing_calls<CR>', { desc = '↱ Outgoing Calls' })

-- ------------------------------------------------------------------------------------------------------------
-- HOVER
-- keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" }) -- show documentation for what is under cursor
keymap.set('n', '<leader>lh', "<cmd>lua require('pretty_hover').hover()<CR>", { desc = ' Hover Documentation' }) -- show documentation for what is under cursor

-- SIGNATURE HELP
keymap.set('n', '<leader>ls', native.signature_help, { desc = ' Signature' }) -- show documentation for what is under cursor

-- RENAME
-- keymap.set('n', '<leader>lr', native.rename, { desc = 'Native Rename' }) -- show documentation for what is under cursor
keymap.set('n', '<leader>lr', '<cmd>Lspsaga rename<CR>', { desc = '牢 Rename Symbol' }) -- smart rename

-- ------------------------------------------------------------------------------------------------------------
-- DIAGNOSTICS STUFF

-- DIAGNOSTICS JUMPING
keymap.set('n', '[d', nativediag.goto_prev, { desc = 'Previous Diagnostics' })
keymap.set('n', ']d', nativediag.goto_next, { desc = 'Next Diagnostics' })
keymap.set('n', '<leader>ip', nativediag.goto_prev, { desc = '⬅ Previous Diagnostics' })
keymap.set('n', '<leader>in', nativediag.goto_next, { desc = '➡ Next Diagnostics' })
-- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostics" }) -- jump to previous diagnostic in buffer
-- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostics" }) -- jump to next diagnostic in buffer

-- Diagnostics search
keymap.set('n', '<leader>id', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = ' Document Diagnostics' })
keymap.set('n', '<leader>iD', '<cmd>Telescope diagnostics<CR>', { desc = '❌Workspace Diagnostics' })

-- LINE DIAGNOSTICS
keymap.set(
    'n',
    '<leader>il',
    '<cmd>Lspsaga show_line_diagnostics<CR>',
    { desc = '林 Diagnostics under cursor (saga) ' }
) -- show  diagnostics for line

-- CURSOR DIAGNOSTICS
keymap.set('n', '<leader>ic', nativediag.open_float, { desc = ' Diagnostic under cursor (nat)' })
keymap.set(
    'n',
    '<leader>ia',
    '<cmd>Lspsaga show_cursor_diagnostics<CR>',
    { desc = ' Diagnostics under cursor (SAGA)' }
) -- show diagnostics for cursor

-- Quickfix List
keymap.set('n', '<leader>iq', 'nativediag.setloclist', { desc = ' Send Diagnostics to LocList' }) -- show diagnostics for cursor

-- NAVIGATION
if require('core.enable_plugins').navbuddy then
    keymap.set('n', '<leader>lx', '<cmd>Navbuddy<CR>', { desc = ' Symbol Browser' }) -- show  diagnostics for line
end

-- ------------------------------------------------------------------------------------------------------------
-- CODE ACTIONS

-- TODO: telescope seems like a better solution :
-- https://github.com/aznhe21/actions-preview.nvim
-- vim.keymap.set({ "v", "n" }, '<leader>la', require("actions-preview").code_actions)
CodeActionsDescription = ' Code Actions'
CodeActionMenuEnabled = require('core.enable_plugins').code_action_menu
LspSagaEnabled = require('core.enable_plugins').lspsaga
if CodeActionMenuEnabled then
    keymap.set('n', '<leader>la', '<cmd>CodeActionMenu<CR>', { desc = 'com' .. CodeActionsDescription }) -- see available code actions
    keymap.set('n', '<leader>lA', '<cmd>CodeActionMenu<CR>', { desc = 'builtin' .. CodeActionsDescription }) -- see available code actions
elseif LspSagaEnabled then
    keymap.set('n', '<leader>la', '<cmd>Lspsaga code_action<CR>', { desc = 'LspSaga' .. CodeActionsDescription }) -- see available code actions
    keymap.set('n', '<leader>lA', '<cmd>Lspsaga code_action<CR>', { desc = 'builtin' .. CodeActionsDescription }) -- see available code actions
else
    keymap.set('n', '<leader>la', vim.lsp.codelens.run, { desc = CodeActionsDescription }) -- see available code actions
end
