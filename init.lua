vim.opt.shadafile = 'NONE' -- Disable this while loading will make it faster
require('core.options')
require('core.statuscolumn')

require('plugins-setup')

require('core.colorscheme')
-- TODO: check if this still neds to be after plugins to work... it would be nice to have keymaps even if plugin fails
require('core.keymaps') -- must be after plugins setup for whichkey to work, maybe it will change after lazy

-- TODO: move this somewhere
require('core.plugins.LSP.configs.lspconfig')
require('core.autocommands')
vim.opt.shadafile = ''
