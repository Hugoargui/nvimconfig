vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
    pattern = '*',
    callback = function()
        -- Improve splits with thinner lines than default and avoid colors from colorschemes
        vim.opt.fillchars = {
            horiz = '━',
            horizup = '┴',
            horizdown = '┬',
            vert = '│',
            vertleft = '┤',
            vertright = '├',
            verthoriz = '┼',
        }

        -- -- with what we're doin in statuscolun not needed
        -- vim.opt.fillchars:append({ fold = ' ' })
        -- vim.opt.fillchars:append({ foldopen = '' })
        -- vim.opt.fillchars:append({ foldclose = '' })
        -- vim.opt.fillchars:append({ foldsep = '│' })

        vim.api.nvim_set_hl(0, 'SignColumn', { link = 'LineNr' }) -- In some colorschemes it's very different and ugly

        vim.api.nvim_set_hl(0, 'WhichKey', { link = 'Function' }) -- The key
        vim.api.nvim_set_hl(0, 'WhichKeySeparator', { link = 'WhichKey' }) -- The separator between the key and its label
        vim.api.nvim_set_hl(0, 'WhichKeyDesc', { link = 'WhichKey' }) -- The key description
        vim.api.nvim_set_hl(0, 'WhichkeyGroup', { link = 'WhichKey' }) -- A group description
        vim.api.nvim_set_hl(0, 'WhichKeyValue', { link = 'WhichKey' }) -- Used by plugins that provide values

        vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { link = 'TodoBgTODO' })

        vim.api.nvim_set_hl(0, '@lsp.typemod.variable.globalScope.cpp', { link = 'DiagnosticError' })
        vim.api.nvim_set_hl(0, '@lsp.typemod.variable.global', { link = 'DiagnosticError' })

        vim.api.nvim_set_hl(0, '@lsp.typemod.variable.static.cpp', { link = 'DiagnosticWarn' })
        vim.api.nvim_set_hl(0, '@lsp.type.method', { link = 'DiagnosticWarn' })

        vim.api.nvim_set_hl(0, '@lsp.mod.readonly', { link = 'DiagnosticOk' })
        vim.api.nvim_set_hl(0, '@lsp.mod.readonly.cpp', { link = 'DiagnosticOk' })

        vim.api.nvim_set_hl(0, '@string.cpp', { link = 'BufferVisible' })

        vim.api.nvim_set_hl(0, 'SpellBad', { fg = '#ff0000', underline = true })
        vim.api.nvim_set_hl(0, 'SpellCap', { fg = '#00FFFF', underline = true })
        vim.api.nvim_set_hl(0, 'SpellRare', { fg = '#FFBF00', underline = true })
        vim.api.nvim_set_hl(0, 'SpellLocal', { fg = '#FFBF00', underline = true })

        vim.api.nvim_set_hl(0, 'StatusLineNc', { bg = 'none' })

        vim.api.nvim_set_hl(0, 'WinSeparator', { link = 'TelescopeBorder' })
        vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { link = 'TelescopeBorder' })

        -- Use vim illuminate.
        -- Use highlight set by by LSP instead of the default 'underline'
        vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'LspReferenceText' })
        vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'LspReferenceRead' })
        vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'LspReferenceWrite' })

        vim.api.nvim_set_hl(0, 'CurSearch', { link = 'IncSearch' })

        vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#993939' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379', bg = '#31353f' })

        vim.api.nvim_set_hl(0, 'SubstituteSubstituted', { link = 'lualine_a_insert' })
        -- Doesn't seem to work
        vim.api.nvim_set_hl(0, 'SubstituteRange', { link = 'lualine_a_normal' })
        vim.api.nvim_set_hl(0, 'SubstituteExchange', { link = 'lualine_a_normal' })

        -- vim.api.nvim_set_hl(0, 'UfoFoldedBg', { link = 'Folded.background' })
        -- vim.api.nvim_set_hl(0, 'UfoFoldedFg', { link = 'Folded.foreground' })

        -- DEBUG ICONS AND HIGHLIGHTS'
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#993939' })

        vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = '#31353f' })
        vim.fn.sign_define(
            'DapLogPoint',
            { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' }
        )

        vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379', bg = '#31353f' })
        vim.fn.sign_define(
            'DapStopped',
            { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' }
        )

        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
        vim.fn.sign_define(
            'DapBreakpointCondition',
            { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' }
        )
        vim.fn.sign_define(
            'DapBreakpointRejected',
            { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
        )

        -- Change the Diagnostic symbols in the sign column (gutter)
        local icons = require('core.icons').icons
        local signs = {
            Error = icons.diagnostics.Error,
            Warn = icons.diagnostics.Warn,
            Hint = icons.diagnostics.Hint,
            Info = icons.diagnostics.Info,
        }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            -- IF YOU WANT THEM ON THE GUTTER (OVERLAPS WITH GITSIGNS)
            -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })

            -- IF YOU DEFINE YOUR OWN DIAGNOSTICS COLUMN, DONT'T SHOW ON DEFAULT SIGNCOLUMN
            vim.fn.sign_define(hl, { text = '', texthl = hl, numhl = '' })
        end
    end, -- end of autocommand callback
}) -- end of colorscheme autocommand

-- This colorscheme is set by the ColorScheme Picker
-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme rose-pine")
vim.g.theme_id = 19
-- end themery block
--
