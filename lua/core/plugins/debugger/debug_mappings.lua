local keymap = vim.keymap --for conciseness

keymap.set(
    -- TO DEBUG LUA FILES WITH ONE-SMALL-STEP-FOR-VIMKIND:
    -- Launch the server in the debuggee using <leader>dl
    -- Open another Neovim instance with the source file
    -- Place breakpoint with <leader>db
    -- Connect using the DAP client with dap_continue <leader>dd
    -- Run your script/plugin in the debuggee

    'n',
    '<leader>dl',
    [[:lua require"osv".launch({port = 8086})<CR>]],
    { desc = '歷 Launch server', noremap = true }
)

keymap.set('n', '<leader>du', "<cmd>lua require'dapui'.toggle()<cr>", { desc = ' Toggle UI' })

keymap.set('n', '<leader>dd', "<cmd>lua require'dap'.continue()<cr>", { desc = ' Launch/Continue' })
keymap.set('n', '<leader>dn', "<cmd>lua require'dap'.step_over()<cr>", { desc = '↷ Step Over' })
keymap.set('n', '<leader>di', "<cmd>lua require'dap'.step_into()<cr>", { desc = '⇲ Step Into' })
keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_out()<cr>", { desc = '⇱ Step Out' })
keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = '↨ Run To Cursor' })

keymap.set('n', '<leader>dk', '<cmd>:lua require"dap".up()<CR>zz', { desc = '⇓ Jump DOWN the callstack' })
keymap.set('n', '<leader>dj', '<cmd>:lua require"dap".down()<CR>zz', { desc = '⇑ Jump UP the callstack' })

keymap.set(
    'n',
    '<leader>db',
    "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
    { desc = '✋Breakpoint' }
)
keymap.set(
    'n',
    '<leader>dc',
    "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
    { desc = '≹ Conditional Breakpoint' }
)
keymap.set(
    'n',
    '<leader>dC',
    "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
    { desc = ' Clear All Breakpoints' }
)

keymap.set('n', '<leader>dR', "<cmd>lua require'dap'.repl.open()<CR>", { desc = ' Open DAP REPL' })

keymap.set('n', '<leader>dh', function()
    require('dap.ui.widgets').hover()
end, { desc = ' Symbol hover info' })
keymap.set('n', '<leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, { desc = ' Scopes and Variables' })
keymap.set('n', '<leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, { desc = ' Threads and Stack Frames' })

-- keymap.set("v", "<leader>dh", "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", { desc = "Symbol hover info" })

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
keymap.set('n', '<leader>dB', '<cmd>Telescope dap list_breakpoints<CR>', { desc = ' Breakpoint list' })
keymap.set('n', '<leader>dF', '<cmd>Telescope dap frames<CR>', { desc = '遲 Frames List' })

return {}
