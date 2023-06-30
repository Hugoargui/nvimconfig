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

        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end

        return {
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- mapping = cmp.mapping.preset.insert({
            mapping = {
                ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-q>'] = cmp.mapping.abort(),
                ['<C-l>'] = cmp.mapping.confirm(),

                -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                -- ['<S-CR>'] = cmp.mapping.confirm({
                --   behavior = cmp.ConfirmBehavior.Replace,
                --   select = true,
                -- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                -- ['<CR>'] = cmp.mapping.confirm({ select = true }),

                --     ['<Tab>'] = cmp.mapping(function(fallback)
                --         -- Intellij-like mapping: confirm with tab, and if no entry is selected, confirm first item
                --         if cmp.visible() then
                --             local entry = cmp.get_selected_entry()
                --             if not entry then
                --                 cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                --             else
                --                 cmp.confirm()
                --             end
                --             cmp.select_next_item()
                --         elseif luasnip.expand_or_jumpable() then
                --             luasnip.expand_or_jump()
                --         elseif has_words_before() then
                --             cmp.complete()
                --         else
                --             fallback()
                --         end
                --     end, { 'i', 's' }),
                --
                --     ['<S-Tab>'] = cmp.mapping(function(fallback)
                --         if cmp.visible() then
                --             cmp.select_prev_item()
                --         elseif luasnip.jumpable(-1) then
                --             luasnip.jump(-1)
                --         else
                --             fallback()
                --         end
                --     end, { 'i', 's' }),
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
            experimental = {
                ghost_text = {
                    hl_group = 'CmpGhostText',
                },
            },

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
