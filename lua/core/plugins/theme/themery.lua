return {
    'zaldih/themery.nvim',
    cmd = { 'Themery' },
    opts = {
        themeConfigFile = '~/.config/nvim/lua/core/colorscheme.lua',
        livePreview = true, -- Apply theme while browsing. Default to true.
        themes = {
            {
                name = 'Ayu',
                colorscheme = 'ayu',
            },
            {
                name = 'Catppuccin',
                colorscheme = 'catppuccin',
            },
            -- -- with colorbuddy and so on it's very slow to load and gives too much trouble
            -- {
            --     name = 'Cobalt2',
            --     colorscheme = 'cobalt2',
            --     before = [[require('colorbuddy').colorscheme('cobalt2')]],
            -- },
            {
                name = 'Everforest',
                colorscheme = 'everforest',
            },
            {
                name = 'Dracula',
                colorscheme = 'dracula',
            },
            {
                name = 'Gruvbox',
                colorscheme = 'gruvbox',
            },
            {
                name = 'Kanagawa',
                colorscheme = 'kanagawa',
            },
            {
                name = 'Melange',
                colorscheme = 'melange',
            },
            {
                name = 'Mellow',
                colorscheme = 'mellow',
            },
            {
                name = 'MoonFly',
                colorscheme = 'moonfly',
            },
            {
                name = 'NightFly',
                colorscheme = 'nightfly',
            },
            {
                name = 'Night Fox',
                colorscheme = 'nightfox',
            },
            {
                name = 'Nord',
                colorscheme = 'nord',
            },
            {
                name = 'OneDark',
                colorscheme = 'onedark',
            },
            {
                name = 'OxoCarbon',
                colorscheme = 'oxocarbon',
            },
            {
                name = 'Rose Pine',
                colorscheme = 'rose-pine',
            },
            {
                name = 'Tokyo Night',
                colorscheme = 'tokyonight',
            },
            {
                name = 'Tundra',
                colorscheme = 'tundra',
            },
            {
                name = 'Zephyr',
                colorscheme = 'zephyr',
            },
        },
    },
}
