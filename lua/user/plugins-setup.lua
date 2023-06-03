-- Setup {{{*/
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Have packer in a floating window
packer.init({
	max_jobs = 5,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- add list of plugins to install
return packer.startup(function(use)
	--}}}

	use("wbthomason/packer.nvim") -- Let packer manage itself
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	-- use("nvim-lua/popup.nvim") -- Implementation of vim PopUp API in neovim... is it still needed?

	use("lewis6991/impatient.nvim")
	-- use("nathom/filetype.nvim")
	-- use("dstein64/vim-startuptime") -- Get's stuck at 0%

	-- COLORSCHEMES
	use("rktjmp/lush.nvim") -- used by some colorschemes
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- fancy notification windows
	use("rcarriga/nvim-notify")

	-- autosession
	use({ "rmagatti/auto-session" })
	use({
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({--[[your custom config--]]
			})
		end,
	})

	-- Nice highlight of headings and so on in markdown
	use({
		"lukas-reineke/headlines.nvim",
		after = "nvim-treesitter",
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- bufferline
	-- use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use("noib3/nvim-cokeline")

	-- floating term
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Window manager
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("moll/vim-bbye") -- close buffer but leave pane there

	-- Window appearance
	use("levouh/tint.nvim") -- more recent version than shade
	use("b0o/incline.nvim") -- Add file to every split
	use("mrjones2014/smart-splits.nvim") -- used by hydra window-manager
	use("sindrets/winshift.nvim") -- used by hydra window=manager

	-- use({
	-- 	"anuvyklack/windows.nvim",
	-- 	requires = {
	-- 		"anuvyklack/middleclass",
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- 	config = function()
	-- 		vim.o.winwidth = 10
	-- 		vim.o.winminwidth = 10
	-- 		vim.o.equalalways = false
	-- 		require("windows").setup()
	-- 	end,
	-- })

	-- use({
	-- 	"nvim-zh/colorful-winsep.nvim", -- add line borders to splits
	-- 	commit = "d1ae62ab0f0226412caeeebed619a9d364f68a16",
	-- 	config = function()
	-- 		require("colorful-winsep").setup()
	-- 	end,
	-- })

	-- File navigation
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	-- Buffer navigation
	use("jinh0/eyeliner.nvim")
	use("anuvyklack/vim-smartword")

	-- fuzzy finding w/ telescope
	use("nvim-lualine/lualine.nvim")
	use("archibate/lualine-time")
	use("meuter/lualine-so-fancy.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	-- use("rafamadriz/friendly-snippets") -- useful snippets

	-- Todo features
	use("folke/todo-comments.nvim")

	-- Text objects
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "chrisgrieser/nvim-various-textobjs" })

	-- Plugins to speed up editing
	-- TODO: decide between this two, which one has best features.
	-- use("numToStr/Comment.nvim")
	use("terrortylor/nvim-comment")
	-- use("tpope/vim-surround") -- add, delete, change surroundings
	use({
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup({})
		end,
	})
	-- There is also johmsalas/text-case.nvim, but after a couple minutes I gave up on setting it up
	-- it Doesn't seeem to be operator pending, just word under cursor, and that breaks with spiderMotion anyways
	use({
		"arthurxavierx/vim-caser",
	})
	use({ "chrisgrieser/nvim-spider" })
	use({ "kylechui/nvim-surround" })
	use({ "echasnovski/mini.align", branch = "stable" })
	-- use({ "junegunn/vim-easy-align" })
	use("gbprod/cutlass.nvim")
	use("gbprod/yanky.nvim")

	use({
		"norcalli/nvim-colorizer.lua",
		-- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("colorizer").setup()
		end,
	})

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
	use({
		"folke/neodev.nvim", -- adds a bunch of vim/lua annotations/completion/etc for easier config/plugin dev
		config = function()
			require("neodev").setup({
				-- add any options here, or leave empty to use the default settings
			})
		end,
	})
	use("neovim/nvim-lspconfig") -- easily configure language servers
	-- TODO: couldn't get clang builting to work, and anyways I don't want to depend on one LSP. BUt consider if there is a bettter solution
	use({
		"jakemason/ouroboros",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvimdev/lspsaga.nvim" }) -- enhanced LSP UI
	require("packer").use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use("RRethy/vim-illuminate") -- use lsp/treesitter/regex to highlight word under cursor
	use("haringsrob/nvim_context_vt") -- Add virtual text at end of brackts and so on

	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- indent
	use("lukas-reineke/indent-blankline.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("HiPhish/nvim-ts-rainbow2")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	-- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	--
	-- Auto lists
	use("gaoDean/autolist.nvim")

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- compiler plugins
	use("cdelledonne/vim-cmake")

	use({ "folke/which-key.nvim" })
	use("anuvyklack/hydra.nvim")

	-- End of plugins setup
	if packer_bootstrap then
		require("packer").sync()
	end
end) -- function
