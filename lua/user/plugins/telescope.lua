-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
-- require'telescope'.setup{
telescope.setup({
	pickers = {
		colorscheme = {
			enable_preview = true,
			file_ignore_patterns = {
				"%light",
				"%Light",
				"%latte",
				"dayfox",
				"dawnfox",
				"%operandi",
				"limestone",
				"randombones",
				"vimbones",
			},
		},
	},
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		mappings = {
			i = {
				["<Esc>"] = actions.close, -- don't go into normal mode, just close
				["<C-j>"] = actions.move_selection_next, -- scroll the list with <c-j>
				["<C-k>"] = actions.move_selection_previous, -- scroll the list with <c-k>
				["<C-h>"] = actions.select_horizontal, -- open selection in new horizantal split
				["<C-v>"] = actions.select_vertical, -- open selection in new vertical split
				["<C-t>"] = actions.select_tab, -- open selection in new tab
				-- ["<C-y>"] = actions.preview_scrolling_up,
				-- ["<C-e>"] = actions.preview_scrolling_down
			},
		}, -- mappings
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		-- layout_config = {promt_position = "top"}
	}, -- defaults
}) --setup

-- telescope.load_extension("fzf")
--
--
--
