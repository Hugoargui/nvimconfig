local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
-- if not vim.uv.fs_stat(lazypath) then
if not vim.loop.fs_stat(lazypath) then
    vim.notify('Installing Lazy plugin manager, please wait...')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- add list of plugins to install
-- require("lazy").setup({{import = "core.plugins"}})

require('lazy').setup({
    spec = {
        { import = 'core.plugins' },
        { import = 'core.plugins.LSP' },
        { import = 'core.plugins.coding' },
        { import = 'core.plugins.debugger' },
        { import = 'core.plugins.editor' },
        { import = 'core.plugins.git' },
        { import = 'core.plugins.sessions' },
        { import = 'core.plugins.syntax' },
        { import = 'core.plugins.theme' },
        { import = 'core.plugins.theme.colorschemes' },
        { import = 'core.plugins.ui' },
        { import = 'core.plugins.ui.hydra' },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    -- install = { colorscheme = { 'tokyonight', 'habamax' } },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = false, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false, -- get a notification when changes are found
    },
    ui = {
        icons = {
            cmd = ' ',
            config = '',
            event = '',
            ft = ' ',
            init = ' ',
            import = ' ',
            keys = ' ',
            lazy = '󰒲 ',
            loaded = '●',
            not_loaded = '○',
            plugin = ' ',
            runtime = ' ',
            source = ' ',
            start = '',
            task = '✔ ',
            list = {
                '●',
                '➜',
                '★',
                '‒',
            },
        },
        border = 'rounded',
        title = 'Lazy Plugin Manager UI',
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                '2html_plugin',
                'bugreport',
                'compiler',
                'ftplugin',
                'getscript',
                'getscriptPlugin',
                'gzip',
                'logipat',
                'matchit',
                'matchparen',
                'netrw',
                'netrwFileHandlers',
                'netrwPlugin',
                'netrwSettings',
                'optwin',
                'rplugin',
                'rplugin',
                'rrhelper',
                'spellfile_plugin',
                'synmenu',
                'tar',
                'tarPlugin',
                'tohtml',
                'tutor',
                'vimball',
                'vimballPlugin',
                'zip',
                'zipPlugin',
            },
        },
    },
})
