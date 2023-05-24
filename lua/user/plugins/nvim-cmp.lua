-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

vim.opt.completeopt = "menu,menuone,noselect"

-- With friendly snippets plugins this is enough, but we can't customize
-- require("luasnip/loaders/from_vscode").lazy_load()

-- Our own custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/vscode" } })
require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets/from_lua" })

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	experimental = {
		native_mentu = false,
		ghost_text = true,
	},
	mapping = cmp.mapping.preset.insert({
		-- Maybe don't use <CR>, it's annoying that it selects instead of going at a new line when you press enter.
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping(function(fallback)
			-- Intellij-like mapping: confirm with tab, and if no entry is selected, confirm first item
			if cmp.visible() then
				local entry = cmp.get_selected_entry()
				if not entry then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					cmp.confirm()
				end
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
	}),

	-- For integrating LuaSnip, from https://sbulav.github.io/vim/neovim-setting-up-luasnip/
	snippet = {
		expand = function(args)
			if not luasnip then
				return
			end
			luasnip.lsp_expand(args.body)
		end,
	},
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lua" }, -- neovim and Lua extra API, it only enables itself in .lua files
		{ name = "nvim_lsp" }, -- lsp
		{ name = "path" }, -- file system paths
		{ name = "luasnip" }, -- snippets
		{ name = "buffer", keyword_length = 5 }, -- words from this buffer
	}),

	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
			ellipsis_char = "...",
			menu = {
				-- buffer = "[buf]", -- if commented out, it will just show Text
				nvim_ls = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
			},
		}),
	},
})
