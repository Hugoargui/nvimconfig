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
        -- Is this refresh even doing anything?
        -- require('lualine').refresh({
        --     scope = 'all', -- scope of refresh all/tabpage/window
        --     place = { 'statusline' }, -- lualine segment ro refresh.
        -- })
    end, -- end of autocommand callback
}) -- end of colorscheme autocommand

-- This colorscheme is set by the ColorScheme Picker
require('core.themeConfigFile')
