require("tint").setup({
	tint = -60, -- Darquen colors, use a positive value to brighten
	saturation = 0.9, -- Saturation to preserve
	highlight_ignore_patterns = { "Telescope*Border", "WinSeparator", "NvimTreeWinSeparator", "Status.*" }, -- Highlight group patterns to ignore, see `string.find`
})

--  TelescopeBorder
--  TelescopePromptBorder
--  TelescopePreviewBorder
--  TelescopeResultsBorder
