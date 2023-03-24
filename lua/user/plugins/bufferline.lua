local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local wk = require("which-key")
wk.register({
	b = {
		name = "Buffers",
		g = { "<Cmd>BufferLinePick<Cr>", "Pick Buffer" },
		x = {
			name = "Close Buffers",
			x = { "<Cmd>BufferLinePickClose<Cr>", "Pick and Close Buffer" },
			h = { "<Cmd>BufferLineCloseLeft<Cr>", "Close Buffers to the Left" },
			l = { "<Cmd>BufferLineCloseRight<Cr>", "Close Buffers to the Right" },
			o = { [[<Cmd>%bd|e#|bd#<Cr>|'"<Cr>]], "Close All Other Buffers" },
		},
		d = { "<Cmd>bd<Cr>", "Delete Current Buffer" },
		D = { "<Cmd>bd!<Cr>", "Delete Current Buffer (Ignore Unsaved Changes)" },
		o = { [[<Cmd>%bd|e#|bd#<Cr>|'"<Cr>]], "Close All Other Buffers" },
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		["["] = { "<Cmd>BufferLineMovePrev<Cr>", "Move Buffer Left" },
		["]"] = { "<Cmd>BufferLineMoveNext<Cr>", "Move Buffer Right" },
	},
}, {
	prefix = "<Leader>",
})

wk.register({
	["[b"] = { ":BufferLineCyclePrev<Cr>", "Previous Buffer" },
	["]b"] = { ":BufferLineCycleNext<Cr>", "Next Buffer" },
})

-- Bufferline Config {{{*/
-- Simple config found online
bufferline.setup({
	options = {
		show_close_icon = false,
		show_buffer_close_icons = false,
		diagnostics = false, --'nvim_lsp',
		-- adding a separator different that default is ugly when telescope is launched
		-- separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
		-- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				padding = 0,
				separator = true,
				highlight = "Directory",
				text_align = "center",
			},
		},

		custom_filter = function(buf_number)
			-- don't show DAP REPL in bufferline
			if vim.bo[buf_number].filetype ~= "dap-repl" then
				return true
			end
		end,

		highlights = {
			-- separator = {
			--   fg = '#073642',
			--   bg = '#002b36',
			-- },
			-- separator_selected = {
			--   fg = '#073642',
			-- },
			background = {
				fg = "#657b83",
				bg = "#002b36",
			},
			buffer_selected = {
				fg = "#fdf6e3",
				bold = true,
				italic = false,
			},
			fill = {
				bg = "#073642",
			},
		},
	}, -- options
}) --setup

-- complex config from video
-- bufferline.setup {
--   options = {
--     numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
--     close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
--     right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
--     left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
--     middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
--     -- NOTE: this plugin is designed with this icon in mind,
--     -- and so changing this is NOT recommended, this is intended
--     -- as an escape hatch for people who cannot bear it for whatever reason
--     indicator_icon = nil,
--     indicator = { style = "icon", icon = "▎"},
--     buffer_close_icon = "",
--     -- buffer_close_icon = '',
--     modified_icon = "●",
--     close_icon = "",
--     -- close_icon = '',
--     left_trunc_marker = "",
--     right_trunc_marker = "",
--     --- name_formatter can be used to change the buffer's label in the bufferline.
--     --- Please note some names can/will break the
--     --- bufferline so use this at your discretion knowing that it has
--     --- some limitations that will *NOT* be fixed.
--     -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
--     --   -- remove extension from markdown files for example
--     --   if buf.name:match('%.md') then
--     --     return vim.fn.fnamemodify(buf.name, ':t:r')
--     --   end
--     -- end,
--     max_name_length = 30,
--     max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
--     tab_size = 21,
--     diagnostics = false, -- | "nvim_lsp" | "coc",
--     diagnostics_update_in_insert = false,
--     -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
--     --   return "("..count..")"
--     -- end,
--     -- NOTE: this will be called a lot so don't do any heavy processing here
--     -- custom_filter = function(buf_number)
--     --   -- filter out filetypes you don't want to see
--     --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
--     --     return true
--     --   end
--     --   -- filter out by buffer name
--     --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
--     --     return true
--     --   end
--     --   -- filter out based on arbitrary rules
--     --   -- e.g. ilter out vim wiki buffer from tabline in your work repo
--     --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
--     --     return true
--     --   end
--     -- end,
--     -- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
--     offsets = { { filetype = "NvimTree", text = "Explorer",padding = 0, separator = true } },
--     show_buffer_icons = true,
--     show_buffer_close_icons = true,
--     show_close_icon = true,
--     show_tab_indicators = true,
--     persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--     -- can also be a table containing 2 custom separators
--     -- [focused and unfocused]. eg: { '|', '|' }
--     -- separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
--     separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
--     -- separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
--     enforce_regular_tabs = true,
--     always_show_bufferline = true,
--     -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
--     --   -- add custom logic
--     --   return buffer_a.modified > buffer_b.modified
--     -- end
--   },
-- }
--}}}
