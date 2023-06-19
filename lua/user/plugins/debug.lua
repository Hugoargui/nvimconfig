require("dapui").setup()
require("persistent-breakpoints").setup({
	load_breakpoints_event = { "BufReadPost" },
})
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

keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Toggle UI" })

keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.continue()<cr>", { desc = "Launch/Continue" })
keymap.set("n", "<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = "Run To Cursor" })

keymap.set("n", "<leader>dk", '<cmd>:lua require"dap".up()<CR>zz', { desc = "Jump DOWN the callstack" })
keymap.set("n", "<leader>dj", '<cmd>:lua require"dap".down()<CR>zz', { desc = "Jump UP the callstack" })

-- keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
-- keymap.set(
-- 	"n",
-- 	"<leader>dc",
-- 	":lua require'set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
-- 	{ desc = "Conditional Breakpoint" }
-- )
-- keymap.set("n", "<leader>dR", function()
-- 	require("dap").clear_breakpoints()
-- end, { desc = "Clear All Breakpoints" })

keymap.set(
	"n",
	"<leader>db",
	"<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
	{ desc = "Toggle Breakpoint" }
)
keymap.set(
	"n",
	"<leader>dc",
	"<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
	{ desc = "Conditional Breakpoint" }
)
keymap.set(
	"n",
	"<leader>dR",
	"<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
	{ desc = "Clear All Breakpoints" }
)

keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "Open DAP REPL" })

keymap.set("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "Symbol hover info" })
keymap.set("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "Scopes and Variables" })
keymap.set("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end, { desc = "Threads and Stack Frames" })
-- keymap.set("v", "<leader>dh", "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", { desc = "Symbol hover info" })
--
-- vim.keymap.set("n", "<leader>de", function()
-- 	require("dap").set_exception_breakpoints({ "all" })
-- end)
-- vim.keymap.set("n", "<leader>da", function()
-- 	require("debugHelper").attach()
-- end)
-- vim.keymap.set("n", "<leader>dA", function()
-- 	require("debugHelper").attachToRemote()
-- end)

-- Telescope DAP extensions:

require("telescope").load_extension("dap")
keymap.set("n", "<leader>dB", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "Breakpoint list" })
keymap.set("n", "<leader>dF", "<cmd>Telescope dap frames<CR>", { desc = "Frames List" })

-- DEBUG ICONS AND HIGHLIGHTS'

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
