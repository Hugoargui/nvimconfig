vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
    pattern = '*',
    callback = function()
        -- Improve splits with thiner lines than default and avoid colors from colorschemes
        vim.opt.fillchars = {
            -- horiz = "─",
            horiz = '━',
            --     horiz = '─',
            horizup = '┴',
            horizdown = '┬',
            vert = '│',
            vertleft = '┤',
            vertright = '├',
            verthoriz = '┼',
        }
        -- vim.cmd([[ highlight VertSplit   guibg=none ]])
        vim.api.nvim_set_hl(0, 'StatusLineNc', { bg = 'none' })

        vim.opt.fillchars:append({ eob = ' ' }) -- hide ~ in empty lines

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
        -- vim.fn.sign_define("DapBreakpoint", { text = "•", texthl = "red", linehl = "", numhl = "" })
        -- vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
        -- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })

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
        -- vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
        -- vim.fn.sign_define("DapStopped", { text = "🞂", texthl = "green", linehl = "green" })

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
        -- (not in youtube nvim video)
        local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end
    end, -- end of autocommand callback
}) -- end of colorscheme autocommand

-- This colorscheme is set by the ColorScheme Picker
require('core.themeConfigFile')
