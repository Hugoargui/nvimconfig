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
				["]i"] = { query = "@conditional.outer", desc = "Next Conditional" },
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
				["[i"] = { query = "@conditional.outer", desc = "Previous Conditional" },
				["[l"] = { query = "@loop.outer", desc = "Previous Loop" },
			},
			goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "Previous Function End" },
				["[O"] = { query = "@class.outer", desc = "Previous Class End" },
			},
		},
	},
})
