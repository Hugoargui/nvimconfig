-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")

if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
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
-- vim.cmd([[ highlight VertSplit ctermbg=none  guibg=none ]])
vim.cmd([[ highlight StatusLineNc ctermbg=none  guibg=none ]])

-- Hide tildes
vim.cmd([[ highlight NonText ctermfg=none  guifg=bg ]]) -- can't set bg in cterm

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- To show the file on each split with a nice highlihgt
vim.cmd([[ highlight link InclineColor Statement  ]])
