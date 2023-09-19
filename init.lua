vim.opt.shadafile = 'NONE' -- Disable this while loading will make it faster
require('core.options')
require('core.statuscolumn')

require('plugins-setup')

require('core.colorscheme')
require('core.keymaps') -- must be after plugins setup for whichkey to work, mayb eit will change after lazy

require('core.plugins.LSP.configs.lspconfig')
require('core.autocommands')

vim.opt.shadafile = ''
