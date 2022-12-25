vim.opt.shadafile = "NONE" -- Disable this while loading will make it faster
require("user.plugins-setup")
require("impatient")

require("user.core.options")
require("user.core.keymaps")

require("user.plugins.whichkey")

require("user.plugins.telescope")

require("user.plugins.comment")
require("user.plugins.mini-align")
require("user.plugins.nvim-tree")
require("user.plugins.treesitter-objects")
-- require("user.plugins.shade")
-- require("user.plugins.colorful-winsep")
require("user.plugins.incline")
require("user.plugins.nvim-cmp")

require("user.plugins.lsp.mason")
require("user.plugins.lsp.lspsaga")
require("user.plugins.lsp.lspconfig")
require("user.plugins.lsp.null-ls")

require("user.plugins.autopairs")
require("user.plugins.treesiter")
require("user.plugins.indent-blankline")
require("user.plugins.gitsigns")

require("user.plugins.autosession")
require("user.plugins.bufferline")
require("user.plugins.lualine")
-- require("user.plugins.cokeline")

require("user.plugins.toggleterm")

require("user.core.colorscheme")
vim.opt.shadafile = ""
