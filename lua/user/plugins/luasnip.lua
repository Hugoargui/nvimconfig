local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.config.set_config({
	history = true, -- keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", -- update changes as you tupe
	enable_autosnippets = true,
	ext_opts = {
		[require("luasnip.util.types").choiceNode] = {
			active = {
				virt_text = { { "⬤", "white" } },
			},
		},
	},
})

-- SNIPPETS THEMSELVES are setup in nvim-cmp.lua

-- vim.cmd [[
--   imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
--   inoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
--   snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<CR>
--   snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
-- ]]
-- -- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- -- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- -- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- -- " -1 for jumping backwards.
-- -- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
