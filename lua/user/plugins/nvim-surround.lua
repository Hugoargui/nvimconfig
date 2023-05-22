-- vim.api.nvim_set_keymap("n", "ya", "<Plug>(nvim-surround-insert)", { noremap = false, silent = true, desc = "Align" })
-- vim.api.nvim_set_keymap(
-- "n",
-- "ya",
-- "<Plug>(nvim-surround-insert-line)",
-- { noremap = false, silent = true, desc = "Align" }
-- )
-- this breaks
require("nvim-surround").setup({
	keymaps = {
		insert = "false", --"<C-g>s",
		insert_line = "false", --"<C-g>S",
		normal = "false", --"ys",
		normal_cur = "false", --"yss",
		normal_line = "false", --"yS",
		normal_cur_line = "false", --"ySS",
		visual = "false", --'S',
		visual_line = "false", --"gS",
		delete = "false", --"ds",
		change = "false", --"cs",
	},
	-- For them to show properly in whichkey we define them ourselves
})
vim.api.nvim_set_keymap(
	"n",
	"ys",
	"<Plug>(nvim-surround-normal)",
	{ noremap = false, silent = true, desc = "Surround" }
)
vim.api.nvim_set_keymap(
	"n",
	"yS",
	"<Plug>(nvim-surround-normal-line)",
	{ noremap = false, silent = true, desc = "Surround Line" }
)
vim.api.nvim_set_keymap(
	"n",
	"yd",
	"<Plug>(nvim-surround-delete)",
	{ noremap = false, silent = true, desc = "Delete surrounding" }
)
vim.api.nvim_set_keymap(
	"n",
	"yr",
	"<Plug>(nvim-surround-change)",
	{ noremap = false, silent = true, desc = "Replace Surrounding" }
)

-- Until I figure out what this does
-- vim.api.nvim_set_eymap(
-- 	"n",
-- 	"ya",
-- 	"<Plug>(nvim-surround-normal-cur)",
-- 	{ noremap = false, silent = true, desc = "Align" }
-- )

-- until I figure out what to do in visual mode
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"ys",
-- 	"<Plug>(nvim-surround-normal-cur-line)",
-- 	{ noremap = false, silent = true, desc = "Align" }
-- )
-- vim.api.nvim_set_keymap("n", "ya", "<Plug>(nvim-surround-visual)", { noremap = false, silent = true, desc = "Align" })
--
-- vim.api.nvim_set_keymap(
-- "n",
-- "ya",
-- "<Plug>(nvim-surround-visual-line)",
-- { noremap = false, silent = true, desc = "Align" }
-- )
