-- vim.api.nvim_set_keymap("n", "ya", "<Plug>(nvim-surround-insert)", { noremap = false, silent = true, desc = "Align" })
-- vim.api.nvim_set_keymap(
-- "n",
-- "ya",
-- "<Plug>(nvim-surround-insert-line)",
-- { noremap = false, silent = true, desc = "Align" }
-- )
-- this breaks
require("nvim-surround").setup({
	keymaps = { -- If i do them here, I can't set the description and the default is too verbose for which-key
		normal = false,
		normal_line = false,
		normal_cur_line = false, --"ySS",
		delete = false, --"ds",
		change = false, --"cs",

		insert = false, --"<C-g>s",
		insert_line = false, --"<C-g>S",
		visual = false, --'S',
		visual_line = false, --"gS",
	},
	-- For them to show properly in whichkey we define them ourselves
})
vim.api.nvim_set_keymap(
	"n",
	"<CR>s",
	"<Plug>(nvim-surround-normal)",
	{ noremap = false, silent = true, desc = "Surround" }
)
vim.api.nvim_set_keymap(
	"n",
	"<CR>S",
	"<Plug>(nvim-surround-normal-line)",
	{ noremap = false, silent = true, desc = "Surround with delimiters in new line" }
)
vim.api.nvim_set_keymap(
	"n",
	"<CR>d",
	"<Plug>(nvim-surround-delete)",
	{ noremap = false, silent = true, desc = "Delete surrounding" }
)
vim.api.nvim_set_keymap(
	"n",
	"<CR>r",
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
