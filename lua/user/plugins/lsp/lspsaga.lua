-- import lspsaga safely
local saga_status, saga = pcall(require, 'lspsaga')
if not saga_status then
  return
end

saga.setup {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<C-d>',
    scroll_up = '<C-u>',
  },
  request_timeout = 2000,

  -- LSP_FINDER
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      jump_to = 'p',
      expand_or_jump = 'o',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },
  -- PEEK DEFINITION
  definition = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },

  -- CODE ACTIONS
  code_action = {
    num_shortcut = true,
    show_server_name = false,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = 'q',
      exec = '<CR>',
    },
  },

  -- LIGHTBULB
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  -- HOVER DOC
  hover = {
    max_width = 0.6,
    open_link = 'gx',
    open_browser = '!chrome',
  },
  -- Symbols in winbar
  symbol_in_winbar = {
    enable = false,
    ignore_patterns = {},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
}
