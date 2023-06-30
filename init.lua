vim.opt.shadafile = 'NONE' -- Disable this while loading will make it faster
require('core.options')
require('core.statuscolumn')
require('plugins-setup')

require('core.keymaps') -- must be after plugins setup for whichkey to work, mayb eit will change after lazy
require('user.plugins.telescope')
-- require("user.plugins.nvim-hlslens") -- a bit annoying, maybe add toggle

require('user.plugins.autosession')

require('user.plugins.lsp.lspsaga')
require('user.plugins.lsp.lspconfig')
require('user.plugins.lsp.null-ls')
require('user.plugins.treesiter')
require('user.plugins.headerswitch')

require('user.plugins.gitsigns')
require('user.plugins.cokeline')

require('user.plugins.toggleterm')

require('user.plugins.markdown-preview')

require('user.plugins.eyeliner')

require('user.plugins.todo-comments')
require('user.plugins.comment')
require('user.plugins.cutlass')
-- require('user.plugins.autolist') -- gives readme warning on startup, shut up
require('user.plugins.treesitter-objects')

require('core.colorscheme')
require('user.plugins.tint')
require('user.plugins.hydra_menus.toggle_options')
require('user.plugins.hydra_menus.window_manager')
require('user.plugins.hydra_menus.folds')
vim.opt.shadafile = ''

require('user.plugins.debug')
-- require("user.plugins.incline")
-- require("user.plugins.colorful-winsep")
-- Disable built in autocompletion
vim.opt.complete = ''
