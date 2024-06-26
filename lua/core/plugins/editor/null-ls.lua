-- Plugin to setup linters/formatters for any language server
return {
    -- 'jose-elias-alvarez/null-ls.nvim',
    'nvimtools/none-ls.nvim',
    enabled = require('core.enable_plugins').null_ls,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'jayp0521/mason-null-ls.nvim', -- bridges gap b/w mason & null-ls
    },
    config = function()
        -- for conciseness
        local null_ls = require('null-ls')
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

        null_ls.setup({
            debug = false,
            sources = {
                formatting.trim_whitespace.with({
                    filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux' },
                }),
                formatting.autopep8,
                formatting.stylua,
                formatting.clang_format.with({
                    filetypes = { 'cpp', 'c' },
                }),
                formatting.uncrustify.with({
                    filetypes = { 'cpp', 'c' },
                }),
                formatting.rustfmt,
                -- # DIAGNOSTICS #
                -- diagnostics.shellcheck,
                diagnostics.luacheck.with({
                    extra_args = { '--globals', 'vim', '--std', 'luajit' },
                }),
            },
            on_attach = function(current_client, bufnr)
                -- configure format on save
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
    end,
}
