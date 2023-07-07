return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'folke/neodev.nvim', -- adds a bunch of vim/lua annotations/completion/etc for easier config/plugin dev
        },
    },
    -- TODO: This is weird, but when I try to start LSP from here, for lua it gets much slower and it thinks there are 2000+ files in workspace instead of just a few.
}
