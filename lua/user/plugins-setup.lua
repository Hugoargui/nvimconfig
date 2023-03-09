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
return packer.startup(
	function(use)
		--}}}

		use("wbthomason/packer.nvim") -- Let packer manage itself
		use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
		-- use("nvim-lua/popup.nvim") -- Implementation of vim PopUp API in neovim... is it still needed?

		use("lewis6991/impatient.nvim")
		-- use("nathom/filetype.nvim")
		-- use("dstein64/vim-startuptime") -- Get's stuck at 0%

		-- COLORSCHEMES {{{*/
		use("rktjmp/lush.nvim") -- used by some colorschemes

		-- use('shaeinst/roshnivim-cs')
		-- use('rafamadriz/neon')
		-- use('tomasiser/vim-code-dark')
		-- use('Mofiqul/vscode.nvim')
		-- use 'marko-cerovac/material.nvim'
		use("bluz71/vim-nightfly-guicolors")
		-- use('bluz71/vim-moonfly-colors')
		-- use("ChristianChiarulli/nvcode-color-schemes.vim") -- Nvcode, onedark, nord colorschemes with Tree-sitter support.
		use("folke/tokyonight.nvim")
		use("sainnhe/sonokai")
		-- use 'kyazdani42/blue-moon'
		-- use 'mhartington/oceanic-next'
		-- use 'glepnir/zephyr-nvim'
		-- use 'rockerBOO/boo-colorscheme-nvim'
		-- use 'jim-at-jibba/ariake-vim-colors'
		-- use 'Th3Whit3Wolf/onebuddy' --fails
		-- use 'ishan9299/modus-theme-vim'
		-- use 'sainnhe/edge'
		-- use 'theniceboy/nvim-deus'
		-- -- use {'bkegley/gloombuddy', requires = { {'tjdevries/colorbuddy.vim'} } } -- doesn't autopreview
		-- use 'Th3Whit3Wolf/one-nvim'
		-- use 'PHSix/nvim-hybrid'
		-- use 'Th3Whit3Wolf/space-nvim'
		-- use ('yonlu/omni.vim')

		-- use 'ray-x/starry.nvim' -- collection: material,moonlight,dracula blood, monokai...
		-- -- use 'tanvirtin/monokai.nvim' -- monokai is already in starry.vim
		-- use 'ofirgall/ofirkai.nvim'
		-- use 'savq/melange'
		-- use 'RRethy/nvim-base16' -- big collection of base16 colorchemes
		-- use 'fenetikm/falcon'
		-- use 'andersevenrud/nordic.nvim'
		-- -- -- use 'shaunsingh/nord.nvim' -- nord is already in starry.vim and other packages
		-- use("ishan9299/nvim-solarized-lua")
		-- -- -- use 'shaunsingh/solarized.nvim' -- this solaried has worse default highliths than ishan9299
		-- -- -- use 'shaunsingh/moonlight.nvim' --already included in other packages
		-- use 'navarasu/onedark.nvim'
		-- use 'lourenci/github-colors'
		-- use("sainnhe/gruvbox-material")
		-- use 'sainnhe/everforest'
		-- use 'NTBBloodbath/doom-one.nvim'
		-- use 'dracula/vim' -- Already comes in some packages
		-- use("yashguptaz/calvera-dark.nvim")
		-- use 'nxvu699134/vn-night.nvim'
		-- use 'adisen99/codeschool.nvim'
		-- use 'projekt0n/github-nvim-theme'
		-- use 'kdheepak/monochrome.nvim'
		-- use("rose-pine/neovim")
		-- use("mcchrish/zenbones.nvim") -- Contrast variation of typical themes
		-- use({ "catppuccin/nvim", as = "catppuccin" })
		-- use 'FrenzyExists/aquarium-vim'
		use("EdenEast/nightfox.nvim")

		use({ "ellisonleao/gruvbox.nvim" })
		use("Mofiqul/dracula.nvim")
		-- use 'tanvirtin/monokai.nvim'
		-- use "rebelot/kanagawa.nvim"
		-- use("shaunsingh/seoul256.nvim")
		use("challenger-deep-theme/vim")
		-- use 'wadackel/vim-dogrun'
		-- use 'gosukiwi/vim-atom-dark'
		-- use 'KeitaNakamura/neodark.vim'
		-- use 'aktersnurra/no-clown-fiesta.nvim'
		-- use {'nyoom-engineering/oxocarbon.nvim'} -- good examples of alternative UI in screenshots
		-- use 'wuelnerdotexe/vim-enfocado'
		-- use 'preservim/vim-colors-pencil'
		-- use 'ray-x/aurora'
		-- -- use 'adisen99/apprentice.nvim'
		-- use 'Everblush/everblush.nvim'
		-- -- use 'phha/zenburn.nvim'

		--}}}

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

		-- bufferline
		use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
		-- use("noib3/nvim-cokeline")

		-- floating term
		use({ "akinsho/toggleterm.nvim", tag = "*" })

		-- Window manager
		use("szw/vim-maximizer") -- maximizes and restores current window
		use("moll/vim-bbye") -- close buffer but leave pane there

		-- Window appearance
		use("sunjon/shade.nvim") -- dim innactive splits
		use("b0o/incline.nvim") -- Add file to every split
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

		-- fuzzy finding w/ telescope
		use("nvim-lualine/lualine.nvim")
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
		use("rafamadriz/friendly-snippets") -- useful snippets

		-- Text objects
		use("nvim-treesitter/nvim-treesitter-textobjects")

		-- Plugins to speed up editing
		use("numToStr/Comment.nvim")
		-- use("tpope/vim-surround") -- add, delete, change surroundings
		-- use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
		-- use({
		-- 	"kylechui/nvim-surround",
		-- 	tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		-- 	config = function()
		-- 		require("nvim-surround").setup({
		-- 			-- Configuration here, or leave empty to use defaults
		-- 		})
		-- 	end,
		-- })
		use({ "echasnovski/mini.align", branch = "stable" })

		-- managing & installing lsp servers, linters & formatters
		use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
		use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
		use("neovim/nvim-lspconfig") -- easily configure language servers

		use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
		-- to do seems not maintanined, swicht to maintained version in kkharji/lspsaga.nvim
		use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
		-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
		use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

		-- formatting & linting
		use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
		use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

		-- treesitter configuration
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})

		-- auto closing
		use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
		-- use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

		-- git integration
		use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

		-- indent
		use("lukas-reineke/indent-blankline.nvim")

		use({ "folke/which-key.nvim" })

		use("cdelledonne/vim-cmake")

		-- End of plugins setup
		if packer_bootstrap then
			require("packer").sync()
		end
	end

	-- config = {}
) -- function
