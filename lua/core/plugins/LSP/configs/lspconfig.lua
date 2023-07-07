-- ADD A BORDER AROUND LSPCONFIG WINDOW TO MAKE IT MORE READABLE

require('lspconfig.ui.windows').default_options.border = 'single'

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- enable keybinds only for when lsp server available
local on_attach = function()
    require('core.plugins.LSP.configs.lsp_keymaps')
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['clangd'].setup({
    -- filetypes = { "hpp", "h", "c", "cpp", "objc", "objcpp" },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        'clangd',
        '--clang-tidy', -- if you want to run clang-tidy as extra
        '--background-index',
        '--suggest-missing-includes',
        '--query-driver=/usr/bin/x86_64-w64-mingw32-g++',
        -- "--compile-commands-dir=/home/localuser/test/build",
        '--offset-encoding=utf-16',
    },
})

lspconfig['cmake'].setup({
    -- filetypes = { "camake" },
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig['lua_ls'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                },
            },
        },
    },
})
