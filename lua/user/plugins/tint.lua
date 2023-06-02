require("tint").setup({
	tint = -60, -- Darquen colors, use a positive value to brighten
	saturation = 0.9, -- Saturation to preserve
	highlight_ignore_patterns = {
		"Telescope*",
		"WinSeparator",
		"NvimTreeWinSeparator",
		"Status.*",
		-- TODO: This doesn't seem to work: '
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	}, -- Highlight group patterns to ignore, see `string.find`
})
