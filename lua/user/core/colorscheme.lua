-- setup must be called before loading colorschemes

-- we can call colorschemes directly, or with pcall
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("nightfly")

local status, _ = pcall(vim.cmd, "colorscheme nightfly")

if not status then
	print("Colorscheme not found") -- print error if colorscheme not found
	return
end

local opt = vim.opt -- for conciseness

-- Improve splits with thiner lines than default and avoid colors from colorschemes
opt.fillchars = {
	horiz = "─",
	horizup = "┴",
	horizdown = "┬",
	vert = "│",
	vertleft = "┤",
	vertright = "├",
	verthoriz = "┼",
}

-- TODO linking WInseparator works, but linking NvimTreeWinSeparator to it only on changing window with cattpuccin
-- vim.cmd([[ highlight link WinSeparator Type  ]])
-- vim.cmd([[ highlight link NvimTreeWinSeparator WinSeparator  ]])

-- Old way
-- NvimTree has a different HI group for the separator, link both together
-- vim.cmd([[ highlight NvimTreeWinSeparator guifg=White ]])
-- vim.cmd([[ highlight WinSeparator guifg=White ]])

-- Attempt at doint it more flexible
vim.cmd([[ highlight border guifg=#7d3c98 ]]) -- can't set bg in cterm
vim.cmd([[ highlight link WinSeparator border  ]])
vim.cmd([[ highlight link NvimTreeWinSeparator border  ]])
vim.cmd([[ highlight link TelescopeBorder border  ]])
vim.cmd([[ highlight link TelescopePromptBorder border  ]])
vim.cmd([[ highlight link TelescopePreviewBorder border  ]])
vim.cmd([[ highlight link TelescopeResultsBorder border  ]])
-- TelescopeNormal
-- TelescopeBorder
-- TelescopeSelectionCaret
-- TelescopeMatching
-- TelescopePromptNormal
-- TelescopePromptTitle
-- TelescopePromptPrefix
-- TelescopePromptBorder
-- TelescopePreviewTitle
-- TelescopePreviewBorder
-- TelescopeResultsTitle
-- TelescopeResultsBorder
--
vim.cmd([[ highlight StatusLineNc guibg=none ]])

-- Hide tildes
vim.cmd([[ highlight NonText guifg=bg ]]) -- can't set bg in cterm

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- To show the file on each split with a nice highlihgt
vim.cmd([[ highlight link InclineColor Todo  ]])
