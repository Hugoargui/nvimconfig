return {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp', -- install jsregexp (optional!).
    event = 'InsertEnter',
    opts = {
        history = true, -- keep around last snippet local to jump back
        updateevents = 'TextChanged,TextChangedI', -- update changes as you tupe
        enable_autosnippets = true,
        -- ext_opts = {
        --     [require('luasnip.util.types').choiceNode] = {
        --         active = {
        --             virt_text = { { '⬤', 'white' } },
        --         },
        --     },
        -- },
    },
    -- stylua: ignore
    keys = {
      { "<c-l>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<c-h>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
}
