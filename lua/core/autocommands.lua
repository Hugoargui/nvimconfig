vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'html', 'markdown', 'text', 'c', 'cpp', 'h' },
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- We need an autocommand as otherwise ft-plugin lua overwrites this setting
-- Letter  meaning when present in 'formatOptions'
-- t       Auto-wrap text using textWidth
-- c       Auto-wrap comments using textWidth, inserting the current comment leader automatically.
-- r       Automatically insert the current comment leader after hitting <Enter> in Insert mode.
-- o       Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' }) -- don't continue comments on next line
    end,
    desc = "Don't continue comments on new line",
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        --    vim.highlight.on_yank()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 })
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})

-- THIS WAS AT END OF DAP FILE, if it breaks put it back there
vim.api.nvim_create_autocmd('VimLeavePre', {
    pattern = '*',
    callback = function()
        require('dapui').close()
        vim.cmd('SymbolsOutlineClose')
    end,
    desc = "Don't leave it open, or it will have ugly buffers when reopening",
})
