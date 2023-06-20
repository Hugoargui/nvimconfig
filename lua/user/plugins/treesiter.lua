-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

-- vim.cmd([[ autocmd FileType * highlight rainbowcol1 guifg=#FF7B72 gui=bold ]])

-- configure treesitter
treesitter.setup {
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },

  -- WORKS BUT COLORS HARD TO SET TO LOOK NICE
  -- AND SEEEMS TO NOT BE MAINTAINTED ANYMORE
  -- -- Enable rainbow parens
  -- rainbow = {
  -- 	enable = true,
  -- 	-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  -- 	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  -- 	max_file_lines = nil, -- Do not enable for files with more than n lines, int
  -- 	-- colors = {}, -- table of hex strings
  -- 	-- termcolors = {} -- table of colour name strings
  -- },

  -- ensure these language parsers are installed
  ensure_installed = {
    'json',
    'javascript',
    'typescript',
    'tsx',
    'yaml',
    'html',
    'c',
    'cmake',
    'cpp',
    'css',
    'make',
    'markdown',
    'markdown_inline',
    'svelte',
    'graphql',
    'bash',
    'lua',
    'vim',
    'dockerfile',
    'gitignore',
    'python',
  },
  -- auto install above language parsers
  auto_install = true,
}

require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    -- disable = { "jsx", "cpp" },
    -- Which query to use for finding delimiters
    query = {
      'rainbow-parens',
      html = 'rainbow-tags',
    },
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
    hlgroups = {
      'TSRainbowOrange',
      'TSRainbowBlue',
      'TSRainbowRed',
      'TSRainbowGreen',
      'TSRainbowViolet',
      'TSRainbowCyan',
      'TSRainbowYellow',
    },
  },
}
