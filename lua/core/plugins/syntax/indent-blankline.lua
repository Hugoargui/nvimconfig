return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    -- char = "▏",
    char = '│',
    filetype_exclude = {
      'startify',
      'dashboard',
      'dotooagenda',
      'log',
      'fugitive',
      'gitcommit',
      'packer',
      'vimwiki',
      'markdown',
      'json',
      'txt',
      'vista',
      'help',
      'todoist',
      'NvimTree',
      'neo-tree',
      'peekaboo',
      'git',
      'TelescopePrompt',
      'undotree',
      'flutterToolsOutline',
      'help',
      'alpha',
      'dashboard',
      'neo-tree',
      'Trouble',
      'lazy',
    },
    buftype_exclude = { 'terminal', 'nofile' },
    show_trailing_blankline_indent = true,
    show_current_context = true,
  },
}