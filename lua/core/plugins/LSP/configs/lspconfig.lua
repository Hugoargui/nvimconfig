-- ADD A BORDER AROUND LSPCONFIG WINDOW TO MAKE IT MORE READABLE
require('lspconfig.ui.windows').default_options.border = 'single'
vim.diagnostic.config({ float = { border = 'rounded' } })

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Outside of attach as we want this to be available even when no LSP is attached.
vim.keymap.set('n', '<leader>l<space>', '<cmd>LspInfo<CR>', { desc = ' Lsp INFO' })
vim.keymap.set('n', '<leader>lt', '<cmd>Inspect<cr>', { desc = '🎨Show TS HL under cursor' })

local on_attach = function(client, bufnr)
    -- enable keybinds only for when lsp server available
    require('core.plugins.LSP.configs.lsp_keymaps').registerKeymaps(client, bufnr)

    if require('core.enable_plugins').lsp_signature then
        local lsp_signature_config = {
            hint_enable = false, -- virtual hint enable
            hint_prefix = '🐼',
            hint_scheme = 'String',
        }

        require('lsp_signature').on_attach(lsp_signature_config, _)
    end
end

if require('core.enable_plugins').lsp_inlayhints then
    vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
    vim.api.nvim_create_autocmd('LspAttach', {
        group = 'LspAttach_inlayhints',
        callback = function(args)
            if not (args.data and args.data.client_id) then
                return
            end

            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            require('lsp-inlayhints').on_attach(client, bufnr)
        end,
    })
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- lspconfig['rust_analyzer'].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     -- If we installed LSP with rustup instead of Mason, tell to use rustup.
--     cmd = {
--         'rustup',
--         'run',
--         'stable',
--         'rust-analyzer',
--     },
--     assist = { importEnforceGranularity = true, importPrefix = 'crate' },
--     cargo = { allFeatures = true },
--     checkOnSave = true,
--     check = {
--         enable = true,
--         command = 'clippy',
--         features = 'all',
--     },
--     inlayHints = { locationLinks = false },
--     diagnostics = { enable = true, experimental = { enable = true } }, -- to enable more diagnostics not on save
-- })

lspconfig['rust_analyzer'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                allFeatures = true,
                command = 'clippy',
            },
            procMacro = {
                ignored = {
                    ['async-trait'] = { 'async_trait' },
                    ['napi-derive'] = { 'napi' },
                    ['async-recursion'] = { 'async_recursion' },
                },
            },
        },
    },
})

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

lspconfig['pyright'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'python' },
    -- cmd = { 'pyright-langserver', '--stdio' },
    --root_dir = function(startpath)
    --       return M.search_ancestors(startpath, matcher)
    --  end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
            },
        },
    },
    single_file_support = true,
})

lspconfig['cmake'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- -- configure lua server (with special settings)
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
