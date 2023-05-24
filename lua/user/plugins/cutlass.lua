require("cutlass").setup({
	cut_key = "m", -- the key that acts as move/cut
	override_del = "true", -- "<DEL> key also to blackole register"
	exclude = {},
	registers = {
		select = "_", -- put into register "s" or whatever
		delete = "_", -- put into register "d" or whatever
		change = "_", -- put into register "c" or whatever
	},
})
