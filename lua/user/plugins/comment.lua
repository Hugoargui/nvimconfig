-- -- import comment plugin safely
-- local setup, comment = pcall(require, "Comment")
-- if not setup then
-- 	return
-- end

-- -- enable comment
-- comment.setup()

require("nvim_comment").setup({
	line_mapping = "<CR><CR>",
	operator_mapping = "<CR>c",
	comment_chunk_text_object = "ic",
})

-- This is a vim builting plugin, it shows up anyways on [] whichkey
-- with the <plug> name, so may as well document it
local wk = require("which-key")
wk.register({
	["<CR><CR>"] = "Comment LINE toggle",
	["<CR>c"] = "Comment toggle",
})

local visual_opt = {
	mode = "x",
}

local visual_map = {
	["<CR>c"] = "Toggle Comment in Selection",
}
wk.register(visual_map, visual_opt)
