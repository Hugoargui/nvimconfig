-- add list of plugins to installinit.lua
return {
    'rmagatti/auto-session',
    {
        'rmagatti/session-lens',
        dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
        config = function()
            require('session-lens').setup({--[[your custom config--]]
            })
        end,
    },

    'noib3/nvim-cokeline',
    'akinsho/toggleterm.nvim',
    'mrjones2014/smart-splits.nvim', -- used by hydra window-manager
    'sindrets/winshift.nvim', -- used by hydra window=manager
    -- 'jinh0/eyeliner.nvim',
    'anuvyklack/vim-smartword',

    -- Text objects
    'nvim-treesitter/nvim-treesitter-textobjects',
    'chrisgrieser/nvim-various-textobjs',

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
    'anuvyklack/hydra.nvim',

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

    -- formatting & linting
    'jayp0521/mason-null-ls.nvim', -- bridges gap b/w mason & null-ls

    'mfussenegger/nvim-dap',
    'nvim-telescope/telescope-dap.nvim',
    { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },
    'jay-babu/mason-nvim-dap.nvim',
    'Weissle/persistent-breakpoints.nvim',
}
