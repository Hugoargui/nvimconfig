-- import lualine plugin safely
local status, minialign = pcall(require, "mini.align")
if not status then
	return
end

minialign.setup({
	mappings = {
		start = "<CR>a",
		start_with_preview = "<CR>A",
	},
})

-- mini.align seemed too overcomplicated for my usecase, I just want one operator
-- vim.api.nvim_set_keymap("n", "<CR>a", "<Plug>(EasyAlign)", { noremap = false, silent = true, desc = "Align" })
-- vim.api.nvim_set_keymap("x", "<CR>a", "<Plug>(EasyAlign)", { noremap = false, silent = true, desc = "Align" })
