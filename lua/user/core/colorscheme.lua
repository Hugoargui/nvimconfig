-- we can call colorschemes directly, or with pcall
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("nightfly")

-- Improve splits with thiner lines than default and avoid colors from colorschemes
vim.opt.fillchars = {
	-- horiz = "─",
	horiz = "━",
	horizup = "┴",
	horizdown = "┬",
	vert = "│",
	vertleft = "┤",
	vertright = "├",
	verthoriz = "┼",
}

-- Attempt at doint it more flexible
-- vim.cmd([[ highlight border guifg=#7d3c98 ]]) -- can't set bg in cterm
-- vim.cmd([[ highlight link WinSeparator border  ]])
-- vim.cmd([[ highlight link NvimTreeWinSeparator border  ]])

vim.cmd([[ highlight link WinSeparator TelescopeBorder  ]])
vim.cmd([[ highlight link NvimTreeWinSeparator TelescopeBorder  ]])

-- vim.cmd([[ highlight link TelescopeBorder border  ]])
-- vim.cmd([[ highlight link TelescopePromptBorder border  ]])
-- vim.cmd([[ highlight link TelescopePreviewBorder border  ]])
-- vim.cmd([[ highlight link TelescopeResultsBorder border  ]])
--
-- vim.cmd([[ highlight link TelescopePromptTitle border  ]])
-- vim.cmd([[ highlight link TelescopeResultsTitle border  ]])
-- vim.cmd([[ highlight link TelescopePreviewTitle border  ]])
-- vim.cmd([[ highlight link TelescopeResultsLineNr border  ]])
-- vim.cmd([[ highlight link TelescopePromptCounter border  ]])
--
vim.cmd([[ highlight StatusLineNc guibg=none ]])

-- Hide tildes
vim.cmd([[ highlight NonText guifg=bg ]]) -- can't set bg in cterm

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- To show the file on each split with a nice highlihgt
-- vim.cmd([[ highlight link InclineColor Todo  ]])

-- Use vim illuminate.
-- Use highlight set by by LSP instead of the default 'underline'
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "LspReferenceRead" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "LspReferenceWrite" })
