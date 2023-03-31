-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end
-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_auto_close = 1 -- Doesn't do anything
vim.g.nvim_tree_respect_buf_cwd = 1
-- For FileTree to change automatically to our current dir
-- We need to autosetup cwd every time we change folder!
-- autocmd BufEnter * silent! lcd %:p:h
-- vim.api.nvim_create_autocmd({ "BufEnter" }, { command = "lcd %:p:h" })

-- configure nvim-tree
nvimtree.setup({
	-- Close if it's the last window
	-- autoclose = true, -- It says option doesnt exists
	-- open_on_setup = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		side = "left",
		width = 40,
		auto_resize = true,
	},
	-- change folder arrow icons
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "⮞", -- arrow when folder is closed
					arrow_open = "⮟", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for explorer to work well with window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	-- 	git = {
	-- 		ignore = false,
	-- 	},
})
