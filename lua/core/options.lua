local opt = vim.opt   -- for conciseness
vim.g.mapleader = ' ' -- it would be better on keymaps, but we want to load this before lazy.nvim

vim.opt.spelllang = 'en_us'
vim.opt.spell = false -- for now, we enable it only for specific filetypes
vim.opt.spelloptions:append({ 'camel', 'noplainbuffer' })

-- Autosessions plugins recommends this:
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true      -- Enable background buffers
opt.history = 100      -- Remember N lines in history
opt.lazyredraw = false -- true should give faster scrolling
opt.synmaxcol = 240    -- Max column for syntax highlight
opt.updatetime = 100   -- faster completion (4000ms default)
opt.timeoutlen = 300
-- Providers: either specify path or disable, as otherwise nvim will look for them at startup which can be slow.
vim.g.loaded_ruby_provider = 0 -- Don't needed, also suppresses not found warning
vim.g.loaded_perl_provider = 0 -- Don't needed, also suppresses not found warning

-----------------------------------------------------------
-- Backup/swap/undo files storage
-----------------------------------------------------------
opt.backup = false   -- create a backup file
opt.swapfile = false -- create a swapfile file
opt.undofile = true  -- store undo history between nvim sessions

-----------------------------------------------------------
-- APPEARANCE
-----------------------------------------------------------
opt.termguicolors = true -- use guifg and guibg everywhere instead of ctermfg and ctermbg
opt.background = 'dark'
opt.number = true
opt.signcolumn = 'yes'    -- Needed for plugins that dispaly stuff in left column (git status, diagnostics...)
opt.cursorline = true     -- Line on the line we're at, you can set it's style with highlights
opt.virtualedit = 'block' -- Virtual cursor mode can go beyond end of line to make "blocks"

-- no tab line at top
opt.showtabline = 0

-- LastStatus means when to show status bar at the bottom of each window:
-- 0 : No status bar
-- 1 : Only when this is the last window
-- 2 : Always for every window (default)
-- 3 : Only one bar at the bottom, common to all windows
opt.laststatus = 3

-- Height of the command bar at the bottom of the screen bellow the kkkstatus line
-- 0 : No Command Line (will need plugins to display messages and enter commands)
-- 1 : Only one line, enough for command input, but messages may display the annoying "press ENTER to continue"
-- 2 : To avoid messages like press ENTER to continue, but you waste one line of space
opt.cmdheight = 0

-- showmode, if vim should display [INSERT], [NORMAL], etc on the command bar, not necesary with most statusline plugins
opt.showmode = false

opt.scrolloff = 8 -- 999 is quite nice too, keeps cursor in middle of screen
opt.sidescrolloff = 8

opt.wrap = false -- do not wrap long lines

-- split windows below and right, more intutitive than the default
opt.splitright = true
opt.splitbelow = true

-----------------------------------------------------------
-- Tabs & Indentation
-----------------------------------------------------------
opt.expandtab = true  -- Transform tab key to spaces in insert mode
opt.tabstop = 4       -- How many spaces pressing <TAB> inserts if "expandtab" is set
opt.autoindent = true -- Copying indent from current line when starting a new line
opt.shiftwidth = 4    -- N spaces on syntax tabs (tabs in python, after {<CR> in C++...)

-----------------------------------------------------------
-- SEARCH
-----------------------------------------------------------
opt.ignorecase = true -- Search and command line autocompletion is case Insensitive
opt.smartcase = true  -- if ignorecase=TRUE, writting BigCase will turn search into sensitive

-----------------------------------------------------------
-- TEHCNICAL STUFF
-----------------------------------------------------------
opt.fileencoding = 'utf-8'
-- opt.clipboard:append('unnamedplus') -- Use system clipboard
opt.backspace = 'indent,eol,start' -- Make <BACKSPACE> behave like you expect

opt.iskeyword:append('-')          -- make this-word count as a single word

opt.complete = ''                  -- Disable built in autocompletion

opt.shortmess:append('sI')         -- Disable nvim intro
