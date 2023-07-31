return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'HiPhish/nvim-ts-rainbow2' },
        -- build = ':TSUpdate',
        -- event = { 'BufReadPost', 'BufNewFile' },
        cmd = {
            'TSInstall',
            'TSBufEnable',
            'TSBufDisable',
            'TSEnable',
            'TSDisable',
            'TSModuleInfo',
        },

        config = function()
            require('nvim-treesitter.configs').setup({
                highlight = { enable = true },
                indent = { enable = true },
                context_commentstring = { enable = true, enable_autocmd = false },
                autotag = { enable = true }, -- if nvim-ts-autotag plugin is installed
                ensure_installed = {
                    'bash',
                    'c',
                    'cmake',
                    'comment', -- nested language for the comments of many programming languages
                    'cpp',
                    'css',
                    'dockerfile',
                    'gitcommit',
                    'gitignore',
                    'graphql',
                    'html',
                    'javascript',
                    'json',
                    'lua',
                    'make',
                    'markdown',
                    'markdown_inline',
                    'python',
                    'regex',
                    'svelte',
                    'tsx',
                    'typescript',
                    'vim',
                    'vimdoc',
                    'yaml',
                    'query', -- should always be installed
                },
                auto_install = true,
            })

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
            require('nvim-treesitter.parsers').get_parser_configs().asm = {
                -- Will need to manually install :TSInstall asm
                install_info = {
                    url = 'https://github.com/rush-rs/tree-sitter-asm.git',
                    files = { 'src/parser.c' },
                    branch = 'main',
                },
            }
        end,
    },
}
