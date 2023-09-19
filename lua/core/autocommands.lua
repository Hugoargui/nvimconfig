vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'txt', 'md', 'c', 'cpp', 'h', 'markdown' },
    callback = function()
        vim.opt.spell = true
    end,
})
vim.api.nvim_create_autocmd('WinLeave', {
    pattern = '*',
    callback = function()
        vim.opt.spell = false
    end,
})
