-- mini.align seemed too overcomplicated for my usecase, I just want one operator
-- -- import lualine plugin safely
-- local status, minialign = pcall(require, "mini.align")
-- if not status then
-- 	return
-- end

-- minialign.setup({
-- 	mappings = {
-- 		-- start = "ga",
-- 		-- start_with_preview = "gA",
-- 		start = "ya",
-- 		start_with_preview = "yA",
-- 	},
-- })

vim.api.nvim_set_keymap("n", "ya", "<Plug>(EasyAlign)", { noremap = false, silent = true, desc = "Align" })
vim.api.nvim_set_keymap("x", "ya", "<Plug>(EasyAlign)", { noremap = false, silent = true, desc = "Align" })
