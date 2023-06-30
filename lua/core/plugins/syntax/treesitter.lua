return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'HiPhish/nvim-ts-rainbow2' },
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        event = 'BufReadPost',
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            autotag = { enable = true }, -- if nvim-ts-autotag plugin is installed
            ensure_installed = {
                'json',
                'javascript',
                'typescript',
                'tsx',
                'yaml',
                'html',
                'c',
                'cmake',
                'cpp',
                'css',
                'make',
                'markdown',
                'markdown_inline',
                'svelte',
                'graphql',
                'bash',
                'lua',
                'vim',
                'dockerfile',
                'gitignore',
                'python',
            },
            auto_install = true,
        },
        config = function()
            require('nvim-treesitter.configs').setup({
                rainbow = {
                    enable = true,
                    -- list of languages you want to disable the plugin for
                    -- disable = { "jsx", "cpp" },
                    -- Which query to use for finding delimiters
                    query = {
                        'rainbow-parens',
                        html = 'rainbow-tags',
                    },
                    -- Highlight the entire buffer all at once
                    strategy = require('ts-rainbow').strategy.global,
                    hlgroups = {
                        'TSRainbowOrange',
                        'TSRainbowBlue',
                        'TSRainbowRed',
                        'TSRainbowGreen',
                        'TSRainbowViolet',
                        'TSRainbowCyan',
                        'TSRainbowYellow',
                    },
                },
            })
        end,
    },
}
