-- Plugin to sestup linters/formatters for any language server
return {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'jayp0521/mason-null-ls.nvim', -- bridges gap b/w mason & null-ls
    },
    config = function()
        -- for conciseness
        local null_ls = require('null-ls')
        local formatting = null_ls.builtins.formatting
        -- local diagnostics = null_ls.builtins.diagnostics

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

        null_ls.setup({
            debug = false,
            sources = {
                formatting.autopep8,
                formatting.stylua,
                formatting.clang_format.with({
                    filetypes = { 'cpp', 'c' },
                }),
                formatting.uncrustify.with({
                    filetypes = { 'cpp', 'c' },
                }),
            },
            on_attach = function(current_client, bufnr)
                if current_client.supports_method('textDocument/formatting') then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                filter = function(client)
                                    --  only use null-ls for formatting instead of lsp server
                                    return client.name == 'null-ls'
                                end,
                                bufnr = bufnr,
                            })
                        end,
                    })
                end
            end,
        })
        -- configure format on save
    end,
}
