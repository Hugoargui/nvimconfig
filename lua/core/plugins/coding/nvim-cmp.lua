local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        -- 'hrsh7th/cmp-cmdline',
        -- 'hrsh7th/cmp-calc',
        -- 'lukas-reineke/cmp-rg',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim',
    },
    event = 'InsertEnter',
    opts = function()
        vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        vim.opt.completeopt = 'menu,menuone,noselect'

        local kind_icons = {
            Text = '',
            Method = 'm',
            Function = '',
            Constructor = '',
            Field = '',
            Variable = '',
            Class = '',
            Interface = '',
            Module = '',
            Property = '',
            Unit = '',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = '',
            Event = '',
            Operator = '',
            TypeParameter = '',
        }

        -- Our own custom snippets
        require('luasnip.loaders.from_vscode').lazy_load({ paths = { './snippets/vscode' } })
        require('luasnip.loaders.from_lua').lazy_load({ paths = './snippets/from_lua' })

        return {
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-q>'] = cmp.mapping.abort(),
                ['<C-l>'] = cmp.mapping.confirm(),
            },

            sources = cmp.config.sources({
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lua' }, -- neovim and Lua extra API, it only enables itself in .lua files
                { name = 'nvim_lsp' }, -- lsp
                { name = 'path' }, -- file system paths
                { name = 'luasnip' }, -- snippets
                { name = 'buffer', keyword_length = 5 }, -- words from this buffer
            }),
            -- configure lspkind for vs-code like icons
            formatting = {
                format = function(entry, vim_item)
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

                    vim_item.menu = ' '
                        .. ({
                            nvim_lua = '[NVIM]',
                            nvim_lsp = '[LSP]',
                            path = '[PATH]',
                            luasnip = '[SNIP]',
                            buffer = '[FILE]',
                        })[entry.source.name]
                    return vim_item
                end,
            },
            -- it's annoying it doesn't move text right when ghost text shows
            -- experimental = {
            --     ghost_text = {
            --         hl_group = 'CmpGhostText',
            --     },
            -- },

            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
                }),
                documentation = cmp.config.window.bordered(),
            },
        }
    end,
}

return M
