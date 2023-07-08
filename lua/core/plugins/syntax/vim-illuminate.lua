-- use lsp/treesitter/regex to highlight word under cursor
return {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { 'lsp' },
        },
    },
    config = function(_, opts)
        require('illuminate').configure(opts)
    end,

    keys = {
        { '<M-n>', desc = 'Next Reference' },
        { '<M-p>', desc = 'Prev Reference' },
    },
}
