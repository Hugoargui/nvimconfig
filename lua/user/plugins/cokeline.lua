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

local red = vim.g.terminal_color_1
local green = vim.g.terminal_color_2
local yellow = vim.g.terminal_color_3

require("cokeline").setup({
	default_hl = {
		fg = function(buffer)
			if buffer.is_focused then
				if buffer.is_modified then
					return get_hex("Title", "fg") -- Highlighted buffer, modified. Light Text red FG
				else
					return get_hex("IncSearch", "fg") -- Highlighted buffer, not modified. Grey text, normal bg
				end
			else
				if buffer.is_modified then
					return get_hex("DiagnosticError", "fg") -- Not Highlighted buffer, modified, red text
				else
					return get_hex("Comment", "fg")
				end
			end
		end,
		bg = function(buffer)
			if buffer.is_focused then
				if buffer.is_modified then
					return get_hex("DiagnosticError", "fg")
				else
					return get_hex("IncSearch", "bg")
				end
			else
				return get_hex("ColorColumn", "bg") -- Not focused and not modified, standard background.
			end
		end,
	},

	-- sidebar = {
	-- filetype = "NvimTree",
	-- components = {
	-- 	{
	-- 		-- text = " File Explorer",
	-- 		text = "",
	-- 		-- fg = yellow,
	-- 		bg = get_hex("NvimTreeNormal", "bg"),
	-- 		style = "bold",
	-- 	},
	-- },
	-- },

	components = {

		-- Show separator between buffertabs:
		{
			text = function(buffer)
				return (buffer.index ~= 1) and "▏" or "" -- for some fonts this renders better
				-- return (buffer.index ~= 1) and "⎸" or ""
			end,
			fg = get_hex("Comment", "fg"),
		},

		-- -- Show filetype icon:
		-- {
		-- 	text = function(buffer)
		-- 		return " " .. buffer.devicon.icon
		-- 	end,
		-- 	fg = function(buffer)
		-- 		return buffer.devicon.color
		-- 	end,
		-- },
		-- {
		-- 	text = function(buffer)
		-- 		return buffer.unique_prefix
		-- 	end,
		-- 	fg = get_hex("Comment", "fg"),
		-- 	style = "italic",
		-- },
		{
			text = function(buffer)
				return buffer.filename
			end,
			-- fg = function(buffer)
			-- 	return buffer.is_modified and red or nil
			-- end,
		},
		{
			text = function(buffer)
				return buffer.is_modified and " ● " or " "
			end,
			-- fg = function(buffer)
			-- 	return get_hex("DiagnosticError", "fg")
			-- 	-- return buffer.is_modified and red or nil
			-- end,
		},
		-- {
		-- 	text = " ",
		-- },
	},
})
