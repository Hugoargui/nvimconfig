require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim

			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner" },
			},
			selection_modes = { -- default selection modes
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = false,
		},
		-- Overwrite default [[ (class) and M(function) mappings
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = { query = "@function.outer", desc = "Next Function Start " },
				["]o"] = { query = "@class.outer", desc = "Next Class Start" },
				["]c"] = { query = "@comment.outer", desc = "Next Comment" },
				["]x"] = { query = "@conditional.outer", desc = "Next Conditional" },
				["]l"] = { query = "@loop.outer", desc = "Next Loop" },
			},
			goto_next_end = {
				["]F"] = { query = "@function.outer", desc = "Next Function End" },
				["]O"] = { query = "@class.outer", desc = "Next Class End" },
			},
			goto_previous_start = {
				["[f"] = { query = "@function.outer", desc = "Previous Function Start" },
				["[o"] = { query = "@class.outer", desc = "Previous Class Start" },
				["[c"] = { query = "@comment.outer", desc = "Previous Comment" },
				["[x"] = { query = "@conditional.outer", desc = "Previous Conditional" },
				["[l"] = { query = "@loop.outer", desc = "Previous Loop" },
			},
			goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "Previous Function End" },
				["[O"] = { query = "@class.outer", desc = "Previous Class End" },
			},
		},
	},
})

-- Custom camecalse and smartword text objects:
vim.keymap.set({ "o", "x" }, "aw", '<cmd>lua require("various-textobjs").subword(false)<CR>')
vim.keymap.set({ "o", "x" }, "iw", '<cmd>lua require("various-textobjs").subword(true)<CR>')

-- TODO: iW/aW seem to be ignored, and even when using ia/aa it seems to not behave as expected anyways
-- vim.keymap.set("n", "viW", "BvE")
-- vim.keymap.set("n", "vaW", "BvW")
vim.keymap.set({ "o", "x" }, "iW", ":<c-u>normal! BvE<CR>")
vim.keymap.set({ "o", "x" }, "aW", ":<c-u>normal! BvW<CR>")

vim.keymap.set({ "o", "x" }, "il", ":<c-u>normal! $v^<CR>") -- in line
vim.keymap.set({ "o", "x" }, "al", ":<c-u>normal! $v0<CR>") -- around line
vim.keymap.set({ "o", "x" }, "ai", '<cmd>lua require("various-textobjs").indentation(false, true)<CR>')
vim.keymap.set({ "o", "x" }, "ii", '<cmd>lua require("various-textobjs").indentation(true, true)<CR>')
vim.keymap.set({ "o", "x" }, "ar", '<cmd>lua require("various-textobjs").restOfParagraph(false)<CR>')
vim.keymap.set({ "o", "x" }, "ir", '<cmd>lua require("various-textobjs").restOfIndentation(false)<CR>')
-- camelCase.fooo var = long_case

-- i and a do kind of the same.. think about reuses
vim.keymap.set({ "o", "x" }, "ak", '<cmd>lua require("various-textobjs").key(false)<CR>')
vim.keymap.set({ "o", "x" }, "ik", '<cmd>lua require("various-textobjs").key(true)<CR>')
vim.keymap.set({ "o", "x" }, "av", '<cmd>lua require("various-textobjs").value(false)<CR>')
vim.keymap.set({ "o", "x" }, "iv", '<cmd>lua require("various-textobjs").value(true)<CR>')

-- i and a do kind of the same.. think about reuses
vim.keymap.set({ "o", "x" }, "an", '<cmd>lua require("various-textobjs").number(false)<CR>')
vim.keymap.set({ "o", "x" }, "in", '<cmd>lua require("various-textobjs").number(true)<CR>')
