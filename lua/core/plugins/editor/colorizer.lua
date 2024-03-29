return {
    'norcalli/nvim-colorizer.lua',
    enabled = require('core.enable_plugins').colorizer,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        local colorizer = require('colorizer')

        colorizer.setup({
            css = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            },
            html = { mode = 'background' },
            markdown = { names = false },
            'yaml',
            lua = { names = true },
            '*',
        })
    end,
}
