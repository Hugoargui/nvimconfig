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
--

-- TODO: shold this be part of nvim-cmp.lua?
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if ls.jumpable() then
		ls.jump(-1)
	end
end, { silent = true })

-- -- This is selecting between a list of options
-- -- This is useful for choice nodes if you're using them
-- vim.keymap.set("i", "<c-e>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end)
--
