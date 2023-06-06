-- require("dapui").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
	automatic_setup = true,
	handlers = {}, -- sets up dap in the predefined manner
})

local dap = require("dap")
dap.adapters.executable = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
	name = "lldb1",
	host = "127.0.0.1",
	port = 13000,
}
dap.adapters.lldb = {
	name = "codelldb server",
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
dap.configurations.c = dap.configurations.cpp

local keymap = vim.keymap --for conciseness
keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.continue()<cr>", { desc = "Launch/Continue" })
keymap.set("n", "<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = "Run To Cursor" })
keymap.set(
	"n",
	"<leader>dc",
	":lua require'set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Conditional Breakpoint" }
)
keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "Toggle Breakpoint" })

-- vim.fn.sign_define("DapBreakpoint", { text = "•", texthl = "red", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "🞂", texthl = "green", linehl = "green" })

-- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#993939" })
vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
