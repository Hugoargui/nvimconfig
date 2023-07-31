return {
    'AntonVanAssche/md-headers.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    ft = 'markdown',
    config = function()
        require('md-headers').setup({
            width = 150,
            height = 50,
            borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        })
        -- TODO:  make it appear only in markdown files
        vim.keymap.set(
            'n',
            '<leader>sm',
            '<cmd>MarkdownHeadersClosest<CR>', -- there is the option without "closest" that goes to the first item
            { noremap = false, silent = true, desc = 'Navigate Markdown Headers' }
        )
    end,
}
