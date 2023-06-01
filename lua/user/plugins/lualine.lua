-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = "auto",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "fancy_mode", separator = { left = "", right = "" }, right_padding = 2 },
		},
		lualine_b = {
			{ "fancy_branch" },
			{ "fancy_diff" },
			{ color = { bg = "#8EC07C", fg = "#0A0A0A" } },
		},
		lualine_c = { { "fancy_diagnostics" }, { "fancy_cwd", substitute_home = true } },
		lualine_x = { "" },
		lualine_y = { "fancy_lsp_servers" },
		lualine_z = { "ctime" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
-- lualine.setup({
-- 	options = {
-- 		theme = lualine_nightfly,
-- 	},
-- })
