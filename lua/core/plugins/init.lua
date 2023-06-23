-- add list of plugins to installinit.lua
return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use

  -- COLORSCHEMES
  -- "rktjmp/lush.nvim", -- used by some colorschemes
  --"bluz71/vim-nightfly-colors", as = "nightfly",
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'rose-pine/neovim', name = 'rose-pine' },

  -- fancy notification windows
  -- 'rcarriga/nvim-notify',

  -- autosession
  'rmagatti/auto-session',
  {
    'rmagatti/session-lens',
    dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('session-lens').setup({--[[your custom config--]]
      })
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  -- bufferline
  -- { "akinsho/bufferline.nvim", tag = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" }
  'noib3/nvim-cokeline',

  -- floating term
  'akinsho/toggleterm.nvim',

  -- Window manager
  'szw/vim-maximizer', -- maximizes and restores current window
  'moll/vim-bbye', -- close buffer but leave pane there

  -- Window appearance
  'levouh/tint.nvim', -- more recent version than shade
  'b0o/incline.nvim', -- Add file to every split
  'mrjones2014/smart-splits.nvim', -- used by hydra window-manager
  'sindrets/winshift.nvim', -- used by hydra window=manager

  -- File navigation
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  -- Buffer navigation
  'jinh0/eyeliner.nvim',
  'anuvyklack/vim-smartword',

  -- fuzzy finding w/ telescope
  -- 'nvim-lualine/lualine.nvim',
  -- 'archibate/lualine-time',
  -- 'meuter/lualine-so-fancy.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- snippets
  'L3MON4D3/LuaSnip', -- snippet engine

  -- Todo features
  'folke/todo-comments.nvim',

  -- Text objects
  'nvim-treesitter/nvim-treesitter-textobjects',
  'chrisgrieser/nvim-various-textobjs',

  -- Plugins to speed up editing
  -- TODO: decide between this two, which one has best features.
  -- "numToStr/Comment.nvim"
  'terrortylor/nvim-comment',
  {
    'gbprod/substitute.nvim',
    config = function()
      require('substitute').setup({})
    end,
  },
  -- There is also johmsalas/text-case.nvim, but after a couple minutes I gave up on setting it up
  -- it Doesn't seeem to be operator pending, just word under cursor, and that breaks with spiderMotion anyways
  'arthurxavierx/vim-caser',
  'chrisgrieser/nvim-spider',
  'kylechui/nvim-surround',
  'echasnovski/mini.align',
  -- { "junegunn/vim-easy-align" },
  'gbprod/cutlass.nvim',
  'gbprod/yanky.nvim',

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- managing & installing lsp servers, linters & formatters
  {
    'neovim/nvim-lspconfig', -- easily configure language servers
    dependencies = {
      'folke/neodev.nvim', -- adds a bunch of vim/lua annotations/completion/etc for easier config/plugin dev
    },
  },

  -- TODO: couldn't get clang builting to work, and anyways I don't want to depend on one LSP. BUt consider if there is a bettter solution
  {
    'jakemason/ouroboros',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },
  'nvimdev/lspsaga.nvim', -- enhanced LSP UI
  'weilbith/nvim-code-action-menu',
  'RRethy/vim-illuminate', -- use lsp/treesitter/regex to highlight word under cursor
  'haringsrob/nvim_context_vt', -- Add virtual text at end of brackts and so on

  'onsails/lspkind.nvim', -- vs-code like icons for autocompletion

  -- formatting & linting
  'jose-elias-alvarez/null-ls.nvim', -- configure formatters & linters
  'jayp0521/mason-null-ls.nvim', -- bridges gap b/w mason & null-ls

  'mfussenegger/nvim-dap',
  'jay-babu/mason-nvim-dap.nvim',
  'nvim-telescope/telescope-dap.nvim',
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },
  'Weissle/persistent-breakpoints.nvim',

  -- -- indent
  -- 'lukas-reineke/indent-blankline.nvim',

  -- treesitter configuration
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },
  'HiPhish/nvim-ts-rainbow2',

  -- auto closing
  'windwp/nvim-autopairs', -- autoclose parens, brackets, quotes, etc...

  -- Auto lists
  'gaoDean/autolist.nvim',

  -- git integration
  'lewis6991/gitsigns.nvim', -- show line modifications on left hand side

  -- compiler plugins
  'cdelledonne/vim-cmake',

  -- 'folke/which-key.nvim',
  'anuvyklack/hydra.nvim',
}
