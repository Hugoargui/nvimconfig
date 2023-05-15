-- setup must be called before loading
-- vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("nightfly")

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
vim.cmd([[ highlight link WinSeparator Type  ]])
vim.cmd([[ highlight link NvimTreeWinSeparator WinSeparator  ]])
-- NvimTree has a different HI group for the separator, link both together
-- vim.cmd([[ highlight NvimTreeWinSeparator guifg=White ]])
-- vim.cmd([[ highlight WinSeparator guifg=White ]])

vim.cmd([[ highlight StatusLineNc guibg=none ]])

-- Hide tildes
vim.cmd([[ highlight NonText guifg=bg ]]) -- can't set bg in cterm

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- To show the file on each split with a nice highlihgt
vim.cmd([[ highlight link InclineColor Todo  ]])
