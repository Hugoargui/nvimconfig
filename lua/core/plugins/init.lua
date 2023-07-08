-- add list of plugins to installinit.lua
return {

    'nvim-treesitter/nvim-treesitter-textobjects',
    'chrisgrieser/nvim-various-textobjs',

    -- There is also johmsalas/text-case.nvim, but after a couple minutes I gave up on setting it up
    -- it Doesn't seeem to be operator pending, just word under cursor, and that breaks with spiderMotion anyways
    'arthurxavierx/vim-caser',
    'chrisgrieser/nvim-spider',
    'anuvyklack/vim-smartword',
}
