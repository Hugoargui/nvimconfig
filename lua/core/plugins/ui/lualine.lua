local M = {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = function()
    return {
      options = {
        theme = 'auto',
        section_separators = { left = '', right = '' },
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'nvimtree' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          {
            'diff',
            symbols = {
              added = '+',
              modified = '~',
              removed = '-',
            },
          },
        },
        lualine_c = {
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', hint = 'ﴞ ', info = ' ' },
          },
          { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
          { 'filename', path = 1, symbols = { modified = '[+]', readonly = '🔒', unnamed = '' } },

          {
            function()
              return require('nvim-navic').get_location()
            end,
            cond = function()
              return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
            end,
          },
          {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          function()
            return ' ' .. os.date('%R')
          end,
        },
      },
      extensions = { 'neo-tree', 'lazy' },
    }
  end,
}
return M
