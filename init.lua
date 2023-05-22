vim.opt.shadafile = "NONE" -- Disable this while loading will make it faster
require("user.plugins-setup")
require("impatient")

require("user.core.options")
require("user.core.keymaps")

require("user.plugins.telescope")

require("user.plugins.comment")
require("user.plugins.mini-align")
require("user.plugins.nvim-tree")
require("user.plugins.treesitter-objects")
require("user.plugins.tint")
-- require("user.plugins.colorful-winsep")
-- require("user.plugins.incline")
require("user.plugins.nvim-cmp")

require("user.plugins.lsp.mason")
require("user.plugins.lsp.lspsaga")
require("user.plugins.lsp.lspconfig")
require("user.plugins.lsp.null-ls")

require("user.plugins.autopairs")
require("user.plugins.autolist")
require("user.plugins.treesiter")
require("user.plugins.indent-blankline")
require("user.plugins.gitsigns")

require("user.plugins.autosession")
require("user.plugins.lualine")
-- require("user.plugins.bufferline")
require("user.plugins.cokeline")

require("user.plugins.toggleterm")

require("user.plugins.markdown-preview")

require("user.plugins.whichkey")

require("user.plugins.eyeliner")

require("user.plugins.colorschemes.catppuccin")
require("user.core.colorscheme")
require("user.plugins.luasnip")
vim.opt.shadafile = ""
