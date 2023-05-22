local get_hex = require("cokeline/utils").get_hex

local wk = require("which-key")
wk.register({
	b = {
		name = "Buffers",
		g = { "<Plug>(cokeline-pick-focus)", "Pick Buffer" },
		x = { "<Plug>(cokeline-pick-close)", "Pick and Close Buffer" },
		-- h = { '<Cmd>BufferLineCloseLeft<Cr>', 'Close Buffers to the Left' },
		-- l = { '<Cmd>BufferLineCloseRight<Cr>', 'Close Buffers to the Right' },
		["["] = { "<Cmd>(cokeline-switch-prev)<Cr>", "Move Buffer Left" },
		["]"] = { "<Cmd>(cokeline-switch-next)<Cr>", "Move Buffer Right" },
		o = { [[<Plug>%bd|e#|bd#<Cr>|'"<Cr>]], "Close All Other Buffers" },
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		d = { "<Cmd>bd<Cr>", "Delete Current Buffer" },
		-- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
		D = { "<Cmd>bd!<Cr>", "Delete Current Buffer (Ignore Unsaved Changes)" },
		o = { [[<Cmd>%bd|e#|bd#<Cr>|'"<Cr>]], "Close All Other Buffers" },
	},
}, {
	prefix = "<Leader>",
})

vim.api.nvim_set_keymap("n", "<Left>", "<Plug>(cokeline-focus-prev)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Plug>(cokeline-focus-next)", { noremap = false, silent = true })

wk.register({
	["[b"] = { "<Plug>(cokeline-focus-prev)", "Previous Buffer" },
	["]b"] = { "<Plug>(cokeline-focus-next)", "Next Buffer" },
})

-- vim.api.nvim_set_keymap(k"n", "<space>q", "<Plug>(cokeline-focus-next)", { noremap = false, silent = true })

require("cokeline").setup({
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("ColorColumn", "bg") or get_hex("Normal", "fg")
		end,
		bg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("ColorColumn", "bg")
		end,
	},

	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				-- text = " File Explorer",
				text = "",
				-- fg = yellow,
				bg = get_hex("NvimTreeNormal", "bg"),
				style = "bold",
			},
		},
	},

	components = {
		-- Show separator between buffertabs:
		{
			text = function(buffer)
				return (buffer.index ~= 1) and "▏" or ""
			end,
			fg = get_hex("Normal", "fg"),
		},
		-- Show filetype icon:
		{
			text = function(buffer)
				return " " .. buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.unique_prefix
			end,
			fg = get_hex("Comment", "fg"),
			style = "italic",
		},
		{
			text = function(buffer)
				return buffer.filename .. " "
			end,
		},
		-- Show close icon:
		-- {
		-- 	text = "",
		-- 	delete_buffer_on_left_click = true,
		-- },
		{
			text = " ",
		},
	},
})
