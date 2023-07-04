vim.opt.shadafile = 'NONE' -- Disable this while loading will make it faster
require('core.options')
require('core.statuscolumn')

require('plugins-setup')

require('core.keymaps') -- must be after plugins setup for whichkey to work, mayb eit will change after lazy
require('core.colorscheme')

vim.opt.shadafile = ''

-- TODO: Move all this to Lazy
require('user.plugins.autosession')

require('user.plugins.lsp.lspsaga')
require('user.plugins.lsp.lspconfig')

require('user.plugins.cokeline')

require('user.plugins.toggleterm')

require('user.plugins.headerswitch')
-- require('user.plugins.autolist') -- gives readme warning on startup, shut up
require('user.plugins.treesitter-objects')

require('user.plugins.debug')
require('user.plugins.hydra_menus.toggle_options')
require('user.plugins.hydra_menus.window_manager')
require('user.plugins.hydra_menus.folds')
