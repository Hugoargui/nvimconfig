-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- -- import typescript plugin safely
-- local typescript_setup, typescript = pcall(require, "typescript")
-- if not typescript_setup then
-- 	return
-- end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	-- local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gs", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP finder" }) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "GO TO Declaration" }) -- got to declaration
	keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "GO TO Definition" }) -- go to definition
	keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "GO TO References" }) -- go to definition
	keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "GO TO Implementation" }) -- go to implementation
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" }) -- peek definition and make edits in window
	keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Code Actions" }) -- see available code actions
	keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "Rename" }) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Diagnostics for this line" }) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Diagnostics under cursor" }) -- show diagnostics for cursor
	keymap.set("n", "<leader>ls", "<cmd> lua vim.lsp.buf.signature_help<cr>", { desc = "Signature" }) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline <CR>", { desc = "Toggle Outline" }) -- see outline on right hand side
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostics" }) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostics" }) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Documentation" }) -- show documentation for what is under cursor

	-- if client.name == "tsserver" then -- typescript specific keymaps (e.g. rename file and update imports)
	-- 	keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "Rename file and update imports" }) -- rename file and update imports
	-- 	keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", { desc = "Organize Imports" }) -- organize imports (not in youtube nvim video)
	-- 	keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", { desc = "Removed unused variables" }) -- remove unused variables (not in youtube nvim video)
	-- end
end

--  https://old.reddit.com/r/neovim/comments/wmj8kb/i_have_nullls_and_clangd_attached_to_a_buffer_c/
--  For now, I stumbled upon this Github issue, and it seems to be a problem that Neovim itself must eventually fix.
-- From a helpful user in the thread, I took this code snippet which suppresses the warning:
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end
	notify(msg, ...)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["clangd"].setup({
	-- filetypes = { "hpp", "h", "c", "cpp", "objc", "objcpp" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
		"--query-driver=/usr/bin/x86_64-w64-mingw32-g++",
		-- "--compile-commands-dir=/home/localuser/test/build",
	},
})

lspconfig["cmake"].setup({
	-- filetypes = { "camake" },
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- -- configure html server
-- lspconfig["html"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- -- configure typescript server with plugin
-- typescript.setup({
-- 	server = {
-- 		capabilities = capabilities,
-- 		on_attach = on_attach,
-- 	},
-- })

-- -- configure css server
-- lspconfig["cssls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- -- configure tailwindcss server
-- lspconfig["tailwindcss"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- -- configure emmet language server
-- lspconfig["emmet_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- })
