return {
    'L3MON4D3/LuaSnip',
    enabled = require('core.enable_plugins').luasnip,
    build = 'make install_jsregexp', -- install jsregexp (optional!).
    event = 'InsertEnter',
    opts = {
        history = true, -- keep around last snippet local to jump back
        updateevents = 'TextChanged,TextChangedI', -- update changes as you type
        enable_autosnippets = true,
        -- ext_opts = {
        --     [require('luasnip.util.types').choiceNode] = {
        --         active = {
        --             virt_text = { { '⬤', 'white' } },
        --         },
        --     },
        -- },
    },
    keys = {
        {
            '<c-n>',
            function()
                require('luasnip').jump(1)
            end,
            mode = { 'i', 's' },
        },
        {
            '<c-p>',
            function()
                require('luasnip').jump(-1)
            end,
            mode = { 'i', 's' },
        },
    },
}
