require("various-textobjs").setup({
	-- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
	-- set to 0 to only look in the current line
	lookForwardSmall = 15,

	-- lines to seek forwards for "big" textobjs (linewise textobjs & url textobj)
	lookForwardBig = 30,

	-- use suggested keymaps (see README)
	useDefaultKeymaps = false,

	-- disable some default keymaps. E:g { 'ai', 'ii' }
	disabledKeymaps = {},
})

require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				["af"] = { query = "@function.outer", desc = "Function" },
				["if"] = { query = "@function.inner", desc = "Function" },
				["ao"] = { query = "@class.outer", desc = "Class" },
				["io"] = { query = "@class.inner", desc = "Class" },
				["ac"] = { query = "@comment.inner", desc = "Comment" }, -- outer seems to not work
				["ic"] = { query = "@comment.inner", desc = "Comment" },
				["iz"] = { query = "@conditional.inner", desc = "Conditional" },
				["az"] = { query = "@conditional.outer", desc = "Conditional" },
				["ix"] = { query = "@loop.inner", desc = "Loop" },
				["ax"] = { query = "@loop.outer", desc = "Loop" },
			}, -- textobjectes::select::keymaps
			-- selection_modes = { -- default selection modes
			-- 	["@parameter.outer"] = "v", -- charwise
			-- 	["@function.outer"] = "V", -- linewise
			-- 	["@class.outer"] = "<c-v>", -- blockwise
			-- },
			-- include_surrounding_whitespace = false,
			-- },
		}, -- Select

		-- Overwrite default [[ (class) and M(function) mappings
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = { query = "@function.outer", desc = "Next Function Start " },
				["]o"] = { query = "@class.outer", desc = "Next Class Start" },
				["]c"] = { query = "@comment.outer", desc = "Next Comment" },
				["]z"] = { query = "@conditional.outer", desc = "Next Conditional" },
				["]x"] = { query = "@loop.outer", desc = "Next Loop" },
			},
			goto_next_end = {
				["]F"] = { query = "@function.outer", desc = "Next Function End" },
				["]O"] = { query = "@class.outer", desc = "Next Class End" },
			},
			goto_previous_start = {
				["[f"] = { query = "@function.outer", desc = "Previous Function Start" },
				["[o"] = { query = "@class.outer", desc = "Previous Class Start" },
				["[c"] = { query = "@comment.outer", desc = "Previous Comment" },
				["[z"] = { query = "@conditional.outer", desc = "Previous Conditional" },
				["[x"] = { query = "@loop.outer", desc = "Previous Loop" },
			},
			goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "Previous Function End" },
				["[O"] = { query = "@class.outer", desc = "Previous Class End" },
			},
		}, -- textobjects::move
	}, -- textobjects
})

-- Custom camecalse and smartword text objects:
-- Don't see a difference between aw and iw, just make it directly cw, yw, dw, ...
-- vim.keymap.set({ "o", "x" }, "aw", '<cmd>lua require("various-textobjs").subword(false)<CR>')
-- vim.keymap.set({ "o", "x" }, "iw", '<cmd>lua require("various-textobjs").subword(true)<CR>')
vim.keymap.set({ "o", "x" }, "w", '<cmd>lua require("various-textobjs").subword(true)<CR>')
--
-- just examples for testing word motions right here:
-- uint_type exampleTestFoo() = '<cmd>lua this("always-gives").problems(always)'
-- camelCaseWord()

-- -- TODO: For now iW needs to be  at beginning of word, find a way to make it jump to beginning automatically
vim.keymap.set({ "o", "x" }, "W", "<Plug>(smartword-e)")
-- vim.keymap.set({ "o", "x" }, "aa", ":<c-u>normal! BvW<CRvim.keymap.set({ "o", "x" }, "ia", ":s/<Plug>(smartword-e)")")

vim.keymap.set({ "o", "x" }, "i<CR>", ":<c-u>normal! ggVG<CR>") -- vi<ENTER> selects whole buffer

vim.keymap.set({ "o", "x" }, "il", ":<c-u>normal! $v^<CR>", { desc = "Line" }) -- in line
vim.keymap.set({ "o", "x" }, "al", ":<c-u>normal! $v0<CR>", { desc = "Line" }) -- around line
vim.keymap.set(
	{ "o", "x" },
	"ai",
	'<cmd>lua require("various-textobjs").indentation(false, true)<CR>',
	{ desc = "Indentation" }
)
vim.keymap.set(
	{ "o", "x" },
	"ii",
	'<cmd>lua require("various-textobjs").indentation(true, true)<CR>',
	{ desc = "Indentation" }
)
vim.keymap.set(
	{ "o", "x" },
	"ar",
	'<cmd>lua require("various-textobjs").restOfParagraph(false)<CR>',
	{ desc = "Rest of Paragraph" }
)
vim.keymap.set(
	{ "o", "x" },
	"ir",
	'<cmd>lua require("various-textobjs").restOfIndentation(false)<CR>',
	{ desc = "Rest of Indentation" }
)

-- i and a do kind of the same.. think about reuses
vim.keymap.set({ "o", "x" }, "ak", '<cmd>lua require("various-textobjs").key(false)<CR>', { desc = "Key" })
vim.keymap.set({ "o", "x" }, "ik", '<cmd>lua require("various-textobjs").key(true)<CR>', { desc = "Key" })
vim.keymap.set({ "o", "x" }, "av", '<cmd>lua require("various-textobjs").value(false)<CR>', { desc = "Value" })
vim.keymap.set({ "o", "x" }, "iv", '<cmd>lua require("various-textobjs").value(true)<CR>', { desc = "Value" })

-- i and a do kind of the same.. think about reuses
vim.keymap.set({ "o", "x" }, "an", '<cmd>lua require("various-textobjs").number(false)<CR>', { desc = "Number" })
vim.keymap.set({ "o", "x" }, "in", '<cmd>lua require("various-textobjs").number(true)<CR>', { desc = "Number" })
