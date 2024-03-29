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
        DapEnabled = require('core.enable_plugins').dap
        if DapEnabled then
            require('dapui').close()
        end

        SymbolsOutlineEnabled = require('core.enable_plugins').symbols_outline
        if SymbolsOutlineEnabled then
            vim.cmd('SymbolsOutlineClose')
        end
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    -- If you left oil open, close it
    -- Doesn't work if I do it in VimLeavePre
    -- Oil builitn close() also doesnt' work
    callback = function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            vim.api.nvim_set_current_win(win)
            local buffPath = vim.api.nvim_buf_get_name(0)
            if string.find(buffPath, 'oil://') then
                -- TODO: would be great to find a way without closing the window
                -- vim.api.nvim_command('Bdelete') --fucks up highlight
                vim.api.nvim_command('bd') --fucks up highlight
            end
        end
    end,
})
