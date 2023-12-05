local M = {
    'williamboman/mason.nvim',
    enabled = require('core.enable_plugins').mason,
    event = 'VeryLazy',

    dependencies = {
        { 'williamboman/mason-lspconfig.nvim', module = 'mason' },
        { 'jayp0521/mason-null-ls.nvim' }, -- bridges gap b/w mason & null-ls
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        -- enable mason
        mason.setup()

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                'lua_ls',
                'clangd',
                'cmake',
                'asm_lsp',
                'pyright',
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
        if (require('core.enable_plugins').null_ls)
        then
            local mason_null_ls = require('mason-null-ls')
            mason_null_ls.setup({
                -- list of formatters & linters for mason to install
                ensure_installed = {
                    'stylua', -- lua formatter
                    'cmakelang',
                    'clang_format',
                },
                -- auto-install configured formatters & linters (with null-ls)
                automatic_installation = true,
            })
        end
    end,
}

return M
