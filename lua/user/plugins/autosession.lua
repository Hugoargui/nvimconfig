require('auto-session').setup({
  auto_restore_enabled = true,

  -- presave_cmds = {
  -- 	-- {"tabdo NvimTreeClose " },
  -- 	{ "print NvimTreeClose " },
  -- },
  -- -- LUA only options
  -- bypass_session_save_file_types = nil, -- table: Bypass auto save when only buffer open is one of these file types
  -- cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
  --   restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
  --   pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
  --   post_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChanged` autocmd
})

-- local au_ft = vim.api.nvim_create_augroup("ft", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown,org,txt,tex",
-- 	callback = function()
-- 		vim.wo.spell = true
-- 		vim.wo.spelllang = "en_us"
-- 	end,
-- 	group = au_ft,
-- })

vim.api.nvim_create_autocmd('VimLeavePre', { pattern = '*', command = 'NvimTreeClose' })
