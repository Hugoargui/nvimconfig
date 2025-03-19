return {
    'iamcco/markdown-preview.nvim',
    enabled = require('core.enable_plugins').markdown_preview,
    build = "cd app && npm install",
    ft = 'markdown',
    config = function()
        -- set to 1, nvim will open the preview window after entering the markdown buffer
        -- default: 0
        vim.g.mkdp_auto_start = 0

        -- set to 1, the nvim will auto close current preview window when change
        -- from markdown buffer to another buffer
        -- default: 1
        vim.g.mkdp_auto_close = 1

        vim.cmd(
            "let g:markdown_fenced_languages = ['cpp', 'c', 'python', 'html', 'javascript', 'typescript', 'vim', 'lua', 'css']"
        )

        local wk_enabled = require('core.enable_plugins').whichkey
        if wk_enabled then
            local wkl = require('which-key')

            vim.cmd('autocmd FileType markdown lua RegisterPreviewKeymap()')
            function RegisterPreviewKeymap()
                wkl.register({
                    name = '   Markdown specific actions',
                    ['p'] = { '<cmd>MarkdownPreview<CR>', '👁️ Launch Markdown Preview' },
                }, { prefix = '<leader>a', buffer = 0 })
            end
        else
            vim.keymap.set('n', '<leader>ap', '<cmd>MarkdownPreview<CR>', { desc = '👁️ Launch Markdown Previe' })
        end
    end,
}
