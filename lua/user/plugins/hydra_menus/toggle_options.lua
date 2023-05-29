local Hydra = require("hydra")

local markdownPreview = function()
	if vim.g.mkdp_auto_start == 1 then
		return "[x]"
	else
		return "[ ]"
	end
end
-- local md = markdownPreview

local hint = [[
  ^^
     Toggle Options:
  ^
  _v_ %{ve} Virtual Block
  _c_ %{cul} Cursor Line
  _n_ %{nu} Line numbers
  _r_ %{rnu} Relative numbers  ^^
  ^
  ^^^^  _<Esc>_ or _~_ to exit^^^^
]]
-- _m_ %{md} Markdown Preview  ^^

Hydra({
	name = "Toggle Options",
	hint = hint,
	config = {
		color = "amaranth",
		invoke_on_body = true,
		hint = {
			border = "rounded",
			position = "middle",
			funcs = { md = markdownPreview },
		},
	},
	mode = { "n", "x" },
	body = "~",
	heads = {
		{
			"n",
			function()
				if vim.o.number == true then
					vim.o.number = false
				else
					vim.o.number = true
				end
			end,
			{ desc = "Number Column" },
		},
		{
			"r",
			function()
				if vim.o.relativenumber == true then
					vim.o.relativenumber = false
				else
					vim.o.number = true
					vim.o.relativenumber = true
				end
			end,
			{ desc = "Relative Numbers" },
		},
		{
			"v",
			function()
				if vim.o.virtualedit == "all" then
					vim.o.virtualedit = "block"
				else
					vim.o.virtualedit = "all"
				end
			end,
			{ desc = "Virtual Block" },
		},
		-- Decided to toggle it manually with keymap
		-- I could plug the keymap, here ,setting the global here doesn't seem to work
		-- {
		-- 	"m",
		-- 	function()
		-- 		if vim.g.mkdp_auto_start == 1 then
		-- 			vim.g.mkdp_auto_start = 0,
		-- 		else
		-- 			vim.g.mkdp_auto_start = 1
		--           <Plug>MarkdownPreviewToggle
		-- 		end
		-- 	end,
		-- 	{ desc = "Markdown Preview" },
		-- },
		-- {
		-- 	"i",
		-- 	function()
		-- 		if vim.o.list == true then
		-- 			vim.o.list = false
		-- 		else
		-- 			vim.o.list = true
		-- 		end
		-- 	end,
		-- 	{ desc = "show invisible" },
		-- },
		-- {
		-- 	"s",
		-- 	function()
		-- 		if vim.o.spell == true then
		-- 			vim.o.spell = false
		-- 		else
		-- 			vim.o.spell = true
		-- 		end
		-- 	end,
		-- 	{ exit = true, desc = "spell" },
		-- },
		-- {
		-- "w",
		-- function()
		-- 	if vim.o.wrap ~= true then
		-- 		vim.o.wrap = true
		-- 		-- Dealing with word wrap:
		-- 		-- If cursor is inside very long line in the file than wraps
		-- 		-- around several rows on the screen, then 'j' key moves you to
		-- 		-- the next line in the file, but not to the next row on the
		-- 		-- screen under your previous position as in other editors. These
		-- 		-- bindings fixes this.
		-- 		vim.keymap.set("n", "k", function()
		-- 			return vim.v.count > 0 and "k" or "gk"
		-- 		end, { expr = true, desc = "k or gk" })
		-- 		vim.keymap.set("n", "j", function()
		-- 			return vim.v.count > 0 and "j" or "gj"
		-- 		end, { expr = true, desc = "j or gj" })
		-- 	else
		-- 		vim.o.wrap = false
		-- 		vim.keymap.del("n", "k")
		-- 		vim.keymap.del("n", "j")
		-- 	end
		-- end,
		-- { desc = "wrap" },
		-- },
		{
			"c",
			function()
				if vim.o.cursorline == true then
					vim.o.cursorline = false
				else
					vim.o.cursorline = true
				end
			end,
			{ desc = "Cursor Line" },
		},
		{ "<Esc>", nil, { exit = true } },
		{ "~", nil, { exit = true } },
	},
})
