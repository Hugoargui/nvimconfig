return {
    {
        'nvim-treesitter/nvim-treesitter',
        enabled = require('core.enable_plugins').treesitter,
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
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
                highlight = { enable = true, disable = { 'lua', 'markdown' } },
                -- highlight = { enable = true },
                indent = { enable = false }, -- it's quite bad except on python files
                context_commentstring = { enable = true, enable_autocmd = false },
                autotag = { enable = true }, -- if nvim-ts-autotag plugin is installed
                ensure_installed = {
                    'bash',
                    'c',
                    'cmake',
                    'comment', -- nested language for the comments of many programming languages
                    'cpp',
                    'dockerfile',
                    'gitcommit',
                    'gitignore',
                    'json',
                    'lua',
                    'make',
                    'markdown',
                    'markdown_inline',
                    'python',
                    'query', -- should always be installed
                    'regex',
                    'rust',
                    'vim',
                    'vimdoc',
                    'yaml',
                },
                auto_install = true,
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
