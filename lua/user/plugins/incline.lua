require('incline').setup {
  debounce_threshold = {
    falling = 50,
    rising = 10
  },
  hide = {
    cursorline = false,
    focused_win = false,
    only_win = false
  },
  
  -- You can define your own highlight group to pass it to
  -- window.highlight
  -- You can put both Normal and NormalNC (unfocused window)
  -- In the same group NormalFloat so you can refer to it 
   highlight = {
     groups = {
       InclineNormal = {
         default = true,
         group = "NormalFloat"
       },
       InclineNormalNC = {
         default = true,
         group = "NormalFloat"
       }
   },
 },
  

  ignore = {
    buftypes = "special",
    filetypes = {},
    floating_wins = true,
    unlisted_buffers = true,
    wintypes = "special"
  },
  render = "basic",
  window = {
    margin = {
      horizontal = 1,
      vertical = 1
    },
    options = {
      signcolumn = "no",
      wrap = false
    },
    padding = 1,
    padding_char = " ",
    placement = {
      horizontal = "right",
      vertical = "top"
    },
    width = "fit",

    -- Here you can set the "Normal" highlight for focused and unfocused windows
    -- InclineNormal and InclineNormalNC are the defaults, but you can sest
    -- any highlight you want
    winhighlight = {
      active = {
        EndOfBuffer = "None",
        -- Normal = "InclineNormal",
        Normal = "InclineColor",
        Search = "None"
      },
      inactive = {
        EndOfBuffer = "None",
        Normal = "InclineColor",
        -- Normal = "InclineNormalNC",
        Search = "None"
      }
    },
    zindex = 50
  }
}
