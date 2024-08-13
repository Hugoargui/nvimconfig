return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<leader>lf',
            function()
                require('conform').format({ async = true })
            end,
            mode = '',
            desc = 'Autoformat buffer',
        },
    },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            c = { 'clang-format' },
            cpp = { 'clang-format' },
            rust = { 'rustfmt', lsp_format = 'fallback' },
            ['_'] = { 'trim_whitespace' }, -- _ is for filetypes that don't have other formatters configured
        },
        -- Set default options
        default_format_opts = {
            lsp_format = 'fallback',
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 500 },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
