local keymap = vim.keymap --for conciseness
vim.g.mapleader = " "

-- window management
keymap.set("n", "<C-h>", "<C-w>h") -- navigate window faster
keymap.set("n", "<C-j>", "<C-w>j") -- navigate window faster
keymap.set("n", "<C-k>", "<C-w>k") -- navigate window faster
keymap.set("n", "<C-l>", "<C-w>l") -- navigate window faster

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
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
