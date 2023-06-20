vim.opt.shadafile = 'NONE' -- Disable this while loading will make it faster
require 'user.core.options'
require 'plugins-setup'
--require 'impatient'

-- require 'user.plugins.whichkey'
require 'user.core.keymaps'

require 'user.plugins.telescope'
-- require("user.plugins.nvim-hlslens") -- a bit annoying, maybe add toggle
require 'user.plugins.nvim-tree'

require 'user.plugins.autosession'

require 'user.plugins.nvim-cmp'
require 'user.plugins.luasnip'

require 'user.plugins.lsp.mason'
require 'user.plugins.lsp.lspsaga'
require 'user.plugins.lsp.lspconfig'
require 'user.plugins.lsp.null-ls'
require 'user.plugins.treesiter'
require 'user.plugins.headerswitch'

require 'user.plugins.gitsigns'
require 'user.plugins.lualine'
require 'user.plugins.cokeline'

require 'user.plugins.toggleterm'

require 'user.plugins.markdown-preview'

-- require 'user.plugins.indent-blankline'
require 'user.plugins.eyeliner'

require 'user.plugins.autopairs'
require 'user.plugins.comment'
require 'user.plugins.nvim-surround'
require 'user.plugins.todo-comments'
require 'user.plugins.cutlass'
require 'user.plugins.autolist'
require 'user.plugins.treesitter-objects'

require 'user.plugins.colorschemes.catppuccin'
require 'user.core.colorscheme'
require 'user.plugins.tint'
require 'user.plugins.hydra_menus.toggle_options'
require 'user.plugins.hydra_menus.window_manager'
require 'user.plugins.hydra'
vim.opt.shadafile = ''

require 'user.plugins.debug'
-- require("user.plugins.bufferline")
-- require("user.plugins.incline")
-- require("user.plugins.colorful-winsep")
