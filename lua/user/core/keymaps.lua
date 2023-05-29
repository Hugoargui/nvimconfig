local keymap = vim.keymap --for conciseness
vim.g.mapleader = " "

-- window management
keymap.set("n", "<C-h>", "<C-w>h") -- navigate window faster
keymap.set("n", "<C-j>", "<C-w>j") -- navigate window faster
keymap.set("n", "<C-k>", "<C-w>k") -- navigate window faster
keymap.set("n", "<C-l>", "<C-w>l") -- navigate window faster

-- tab management
-- keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
keymap.set("n", "[t", ":tabn<CR>", { desc = "Previous Tab" }) --  go to next tab
keymap.set("n", "]t", ":tabp<CR>", { desc = "Next Tab" }) --  go to previous tab

keymap.set("n", "<leader>mg", ":CMakeGenerate<cr>", { desc = "Cmake Generate" })
keymap.set("n", "<leader>mb", ":CMakeBuild<cr>", { desc = "Cmake Build" })
keymap.set("n", "<leader>mq", ":CMakeClose<cr>", { desc = "Cmake Close" })
keymap.set("n", "<leader>mc", ":CMakeClean<cr>", { desc = "Cmake Clean" })
vim.cmd([[let g:cmake_link_compile_commands = 1]])

-- delete single character without  into register
keymap.set("n", "x", '"_x')

-- This is a vim builting plugin, it shows up anyways on [] whichkey
-- with the <plug> name, so may as well document it
local wk = require("which-key")
wk.register({
	["[%"] = "which_key_ignore",
	["]%"] = "which_key_ignore",
})

-- Move visual selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ----------------------------------------------------
-- For the substitute plugin
vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })
vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
vim.keymap.set(
	"n",
	"<CR>x",
	require("substitute.exchange").operator,
	{ noremap = true, silent = true, desc = "Exchange" }
)
vim.keymap.set(
	"n",
	"<CR>X",
	require("substitute.exchange").line,
	{ noremap = true, silent = true, desc = "Exchange Line" }
)
vim.keymap.set(
	"x",
	"<CR>x",
	require("substitute.exchange").visual,
	{ noremap = true, silent = true, desc = "Exchange" }
)
vim.keymap.set(
	"n",
	"<CR>c",
	require("substitute.exchange").cancel,
	{ noremap = true, silent = true, desc = "Exchange Cancel" }
)

-- ----------------------------------------------------
vim.keymap.set("n", "<bs>", "q", { noremap = true })

-- ----------------------------------------------------
-- For the smartword plugin
-- This adds motions, but no text objects, I'll create a custom textobject
vim.keymap.set({ "n", "o", "x" }, "W", "<Plug>(smartword-w)", { noremap = false, silent = true, desc = "Surround" })
vim.keymap.set({ "n", "o", "x" }, "B", "<Plug>(smartword-b)", { noremap = false, silent = true, desc = "Surround" })
vim.keymap.set({ "n", "o", "x" }, "E", "<Plug>(smartword-e)", { noremap = false, silent = true, desc = "Surround" })
vim.keymap.set({ "n", "o", "x" }, "Q", "<Plug>(smartword-ge)", { noremap = false, silent = true, desc = "Surround" })

-- For spider casemotion plugin, and skip insignificant puntuation (on by default)
-- This doesnt add text-objects, that's done by the more textobjects plugin
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "q", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
