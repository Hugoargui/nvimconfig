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
                -- TODO: deprecated: replace by another option
                -- formatting.trim_whitespace.with({
                --     filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux' },
                -- }),

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
                diagnostics.shellcheck,
                -- TODO: replace by selene
                -- diagnostics.luacheck.with({
                --     extra_args = { '--globals', 'vim', '--std', 'luajit' },
                -- }),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.formatting_sync()
                        end,
                    })
                end
            end,
        })
    end,
}
