local get_hex = require('cokeline/utils').get_hex

local wk = require('which-key')
wk.register(
  {
    b = {
      name = 'Buffers',
      g = { '<Plug>cokeline-pick-focus', 'Pick Buffer' },
      x = {
        name = 'Close Buffers',
        x = { '<Cmd>cokeline-pick-close<Cr>', 'Pick and Close Buffer' },
        -- h = { '<Cmd>BufferLineCloseLeft<Cr>', 'Close Buffers to the Left' },
        -- l = { '<Cmd>BufferLineCloseRight<Cr>', 'Close Buffers to the Right' },
        o = { [[<Cmd>%bd|e#|bd#<Cr>|'"<Cr>]], 'Close All Other Buffers' },
      },
      d = { '<Cmd>bd<Cr>', 'Delete Current Buffer' },
      D = { '<Cmd>bd!<Cr>', 'Delete Current Buffer (Ignore Unsaved Changes)' },
      o = { [[<Cmd>%bd|e#|bd#<Cr>|'"<Cr>]], 'Close All Other Buffers' },
      b = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
      },
      ['['] = { '<Cmd>cokeline-switch-prev<Cr>', 'Move Buffer Left' },
      [']'] = { '<Cmd>cokeline-switch-next<Cr>', 'Move Buffer Right' },
    }
  },
  {
    prefix = '<Leader>',
  }
)
vim.api.nvim_set_keymap('v', '<space>r', '<Plug>(cokeline-pick-focus)',{noremap = false, silent = true})

wk.register(
  {
    ['[b'] = { '<Plug>cokeline-focus-prev', 'Previous Buffer' },
    [']b'] = { '<Plug>cokeline-focus-next', 'Next Buffer' },
  }
)

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('ColorColumn', 'bg')
         or get_hex('Normal', 'fg')
    end,
    bg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
        or get_hex('ColorColumn', 'bg')
    end,
  },

  sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = '  File Explorer',
        -- fg = yellow,
        bg = get_hex('NvimTreeNormal', 'bg'),
        style = 'bold',
      },
    }
  },

  components = {
    {
      text = function(buffer) return ' ' .. buffer.devicon.icon end,
      fg = function(buffer) return buffer.devicon.color end,
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      fg = get_hex('Comment', 'fg'),
      style = 'italic',
    },
    {
      text = function(buffer) return buffer.filename .. ' ' end,
    },
    {
      text = '',
      delete_buffer_on_left_click = true,
    },
    {
      text = ' ',
    }
  },
})
