-- ADD A BORDER AROUND LSPCONFIG WINDOW TO MAKE IT MORE READABLE
require("lspconfig.ui.windows").default_options.border = "single"

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
local native = vim.lsp.buf -- for conciseness
local nativediag = vim.diagnostic -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function()
	-- TODO: maybe pass {buffer=0} to keymaps set so mappings only apply to current buffer that has LSP attached
	-- See TJdevies Neovim Builtin LSP Setup GUide around minute 31 for more info

	-- ------------------------------------------------------------------------------------------------------------
	-- GO TO DEFINITION
	keymap.set("n", "gd", native.definition, { desc = "GO TO Definition" }) -- go to definition

	-- PPEK DEFINITION
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" }) -- peek definition and make edits in window

	-- GO TO DECLARATION
	keymap.set("n", "gD", native.declaration, { desc = "GO TO Declaration" }) -- got to declaration

	-- GO TO REFERENCES
	keymap.set("n", "gr", native.references, { desc = "GO TO References" }) -- go to definition

	-- GO TO IMPLEMENTATION
	keymap.set("n", "gI", native.implementation, { desc = "GO TO Implementation" }) -- go to implementation

	-- GO TO IMPLEMENTATION
	keymap.set("n", "gt", native.type_definition, { desc = "GO TO Type" }) -- go to type definition

	-- ------------------------------------------------------------------------------------------------------------
	keymap.set("n", "<leader>lx", "native.format{async=true}", { desc = "Auto-Format" }) -- see available code actions

	-- ------------------------------------------------------------------------------------------------------------
	-- LSP OUTLINE
	keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "Toggle Outline" }) -- see outline on right hand side

	-- LSP SEARCH SYMBOLS
	keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })
	keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace Symbols" })
	keymap.set("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP finder" }) -- show definition, references

	-- ------------------------------------------------------------------------------------------------------------
	-- HOVER
	-- keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" }) -- show documentation for what is under cursor
	keymap.set("n", "<leader>lh", native.hover, { desc = "Hover Documentation" }) -- show documentation for what is under cursor

	-- SIGNATURE HELP
	keymap.set("n", "<leader>ls", native.signature_help, { desc = "Signature" }) -- show documentation for what is under cursor

	-- RENAME
	keymap.set("n", "<leader>lr", native.rename, { desc = "Native Rename" }) -- show documentation for what is under cursor
	keymap.set("n", "<leader>lR", "<cmd>Lspsaga rename<CR>", { desc = "LSpsaga Rename" }) -- smart rename

	-- ------------------------------------------------------------------------------------------------------------
	-- DIAGNOSTICS STUFF

	-- DIAGNOSTICS JUMPING
	keymap.set("n", "[d", nativediag.goto_prev, { desc = "Previous Diagnostics" })
	keymap.set("n", "]d", nativediag.goto_next, { desc = "Next Diagnostics" })
	keymap.set("n", "<leader>dp", nativediag.goto_prev, { desc = "Previous Diagnostics" })
	keymap.set("n", "<leader>dn", nativediag.goto_next, { desc = "Next Diagnostics" })
	-- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostics" }) -- jump to previous diagnostic in buffer
	-- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostics" }) -- jump to next diagnostic in buffer

	-- Diagnostics search
	keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Document Diagnostics" })
	keymap.set("n", "<leader>dD", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace Diagnostics" })

	-- LINE DIAGNOSTICS
	keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Diagnostics for this line" }) -- show  diagnostics for line

	-- CURSOR DIAGNOSTICS
	keymap.set("n", "<leader>dc", nativediag.open_float, { desc = "Diagnostic under cursor" })
	keymap.set("n", "<leader>da", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Diagnostics under cursor" }) -- show diagnostics for cursor

	-- Quickfix List
	keymap.set("n", "<leader>dq", "nativediag.setloclist", { desc = "Send Diagnostics to LocList" }) -- show diagnostics for cursor
	-- ------------------------------------------------------------------------------------------------------------
	-- CODE ACTIONS
	keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Code Actions" }) -- see available code actions
	keymap.set("n", "<leader>lA", vim.lsp.codelens.run, { desc = "CodeLens Actions" }) -- see available code actions

	-- ------------------------------------------------------------------------------------------------------------
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
		"--clang-tidy", -- if you want to run clang-tidy as extra
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
lspconfig["lua_ls"].setup({
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
