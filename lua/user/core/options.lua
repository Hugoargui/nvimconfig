local opt = vim.opt -- for conciseness

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event
opt.timeoutlen = 100
----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append("sI")

-- -- Disable builtin plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.g.loaded_ruby_provider = 0 -- Don't needed, also suppresses not found warning
vim.g.loaded_perl_provider = 0 -- Don't needed, also suppresses not found warning
------------------------------------------------------------------------
--
-- APPEARANCE
opt.termguicolors = true
opt.background = "dark"
opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
-- LastStatus means when to show status bar at the bottom of each window:
-- 0 : No status bar
-- 1 : Only when this is the last window
-- 2 : Always for every window (default)
-- 3 : Only one bar at the bottom, common to all windows
opt.laststatus = 3
opt.cmdheight = 2 -- To avoid message press ENTER to continue

opt.showmode = false

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
vim.cmd([[ highlight VertSplit ctermbg=none  guibg=none ]])
vim.cmd([[ highlight StatusLineNc ctermbg=none  guibg=none ]])

vim.cmd([[ highlight NonText ctermfg=none  guifg=bg ]]) -- can't set bg in cterm

-- tabs & indentation
opt.expandtab = true -- Transform tab key to spaces in insert mode
opt.tabstop = 2 -- How many spaces pressing <TAB> inserts if "expandtab" is set
opt.autoindent = true -- Copying indent from current line when starting a new line
opt.shiftwidth = 2 -- N spaces on syntax tabs (tabs in python, after {<CR> in C++...)

opt.wrap = false -- do not wrap long lines

opt.foldmethod = "marker"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- search settings
opt.ignorecase = true -- Search is case INsensitive
opt.smartcase = true -- if ignorecase=TRUE, writting BigCase will turn search into sensitive

------------------------------------------------------------------------
-- TECHNICAL STUFF
opt.clipboard:append("unnamedplus") -- Use system clipboard
opt.backspace = "indent,eol,start" -- Make <BACKSPACE> behave like you expect

opt.iskeyword:append("-") -- make this-word count as a single word
