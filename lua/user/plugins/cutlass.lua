require('cutlass').setup({
    cut_key = 'm', -- the key that acts as move/cut
    override_del = 'false', -- "<DEL> key also to blackole register"
    registers = {
        select = '_', -- put into register "s" or whatever
        delete = '_', -- put into register "d" or whatever
        change = '_', -- put into register "c" or whatever
    },
})

require('yanky').setup({
    ring = {
        history_length = 100,
        storage = 'shada', -- shada, sqlite or memory
        sync_with_numbered_registers = true, -- On yank, updtate 1-9 registers like vim should do by default
        cancel_event = 'update', -- update will cancel ring on next buffer update, move will cancel ring when moving cursor or content changed.
    },
    system_clipboard = {
        sync_with_ring = true,
    },
})

-- To enable gbprod/substitute.nvim swap when performing a substitution, you can add this to your setup:
require('substitute').setup({
    on_substitute = require('yanky.integration').substitute(),
})
--
vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
-- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
-- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set('n', '<c-n>', '<Plug>(YankyCycleForward)')
vim.keymap.set('n', '<c-p>', '<Plug>(YankyCycleBackward)')
-- vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)") -- Preserves cursor position on yank, but breaks other mappings starting in y

-- From cutlass documentation:
-- If you also have vim-cutlass installed then I suggest you set g:yoinkIncludeDeleteOperations to 1.
-- Otherwise the 'cut' operator that you use will not be added to the yank history.
vim.g.yoinkIncludeDeleteOperations = 1

-- ------------------------------------------------------------
-- Hydra integration:
-- local Hydra = require("hydra")

-- local function t(str)
-- return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- TODO think how to implement this good, maybe with subhydras
-- see reference here
-- https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt#L100
-- local yanky_hydra = Hydra({
-- 	name = "Yank ring",
-- 	mode = "n",
-- 	heads = {
-- 		{ "p", "<Plug>(YankyPutAfter)", { desc = "After" } },
-- 		{ "P", "<Plug>(YankyPutBefore)", { desc = "Before" } },
-- 		{ "]", "<Plug>(YankyPutIndentAfterLinewise)", { desc = "IndentAfter" } },
-- 		{ "[", "<Plug>(YankyPutIndentBeforeLinewise)", { desc = "IndentBefore" } },
-- 	},
-- 	-- heads = {
-- 	-- 	{ "p", "<Plug>(YankyPutAfter)", { desc = "After" } },
-- 	-- 	{ "P", "<Plug>(YankyPutBefore)", { desc = "Before" } },
-- 	-- 	{ "<C-n>", "<Plug>(YankyCycleForward)", { private = true, desc = "↓" } },
-- 	-- 	{ "<C-p>", "<Plug>(YankyCycleBackward)", { private = true, desc = "↑" } },
-- 	-- },
-- })
--
-- -- -- choose/change the mappings if you want
-- -- for key, putAction in pairs({
-- -- 	["p"] = "<Plug>(YankyPutAfter)",
-- -- 	["P"] = "<Plug>(YankyPutBefore)",
-- -- 	["gp"] = "<Plug>(YankyGPutAfter)",
-- -- 	["gP"] = "<Plug>(YankyGPutBefore)",
-- -- }) do
-- -- 	vim.keymap.set({ "n", "x" }, key, function()
-- -- 		vim.fn.feedkeys(t(putAction))
-- -- 		yanky_hydra:activate()
-- -- 	end)
-- -- end
-- vim.keymap.set({ "n", "x" }, "<C-v>", function()
-- 	yanky_hydra:activate()
-- end)
-- -- choose/change the mappings if you want
-- for key, putAction in pairs({
-- 	["]p"] = "<Plug>(YankyPutIndentAfterLinewise)",
-- 	["[p"] = "<Plug>(YankyPutIndentBeforeLinewise)",
-- 	["]P"] = "<Plug>(YankyPutIndentAfterLinewise)",
-- 	["[P"] = "<Plug>(YankyPutIndentBeforeLinewise)",
--
-- 	[">p"] = "<Plug>(YankyPutIndentAfterShiftRight)",
-- 	["<p"] = "<Plug>(YankyPutIndentAfterShiftLeft)",
-- 	[">P"] = "<Plug>(YankyPutIndentBeforeShiftRight)",
-- 	["<P"] = "<Plug>(YankyPutIndentBeforeShiftLeft)",
--
-- 	["=p"] = "<Plug>(YankyPutAfterFilter)",
-- 	["=P"] = "<Plug>(YankyPutBeforeFilter)",
-- }) do
-- 	vim.keymap.set("n", key, function()
-- 		vim.fn.feedkeys(t(putAction))
-- 		yanky_hydra:activate()
-- 	end)
-- end
