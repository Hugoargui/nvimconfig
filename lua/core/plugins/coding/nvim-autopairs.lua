return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    opts = {
        check_ts = true, -- enable treesitter
    },
    -- TODO: this makes it to stop workingk, but is it even necessary
    -- config = function()
    --     local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    --     local cmp = require('cmp')
    --     cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    -- end,
}
