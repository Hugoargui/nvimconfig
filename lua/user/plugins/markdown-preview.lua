-- set to 1, nvim will open the preview window after entering the markdown buffer
-- default: 0
vim.g.mkdp_auto_start = 0

-- set to 1, the nvim will auto close current preview window when change
-- from markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 1

-- TODO: consider a way to make the mapping show up only in markdown files, can't be botthered to investigate autocommands now
-- local function registerKeymap()
vim.keymap.set(
  'n',
  '<leader>p',
  '<cmd>MarkdownPreview<CR>',
  { noremap = false, silent = true, desc = 'Launch Markdown Preview' }
)

vim.cmd("let g:markdown_fenced_languages = ['cpp', 'c', 'python', 'html', 'javascript', 'typescript', 'vim', 'lua', 'css']")
-- end
-- vim.cmd("autocmd FileType markdown lua registerKeymap()")
