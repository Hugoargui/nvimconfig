-- Case switcing commands
vim.g.caser_prefix = '<CR>k'
local wk = require('which-key')
local wk_opt = {
    mode = 'n',
    prefix = '<CR>',
}
local wk_map = {
    k = {
        name = 'Change Case',
        ['m'] = 'MixedCase or PascalCase',
        ['p'] = 'MixedCase or PascalCase',
        ['c'] = 'camelCase',
        ['_'] = 'snake_case',
        ['u'] = 'UpperCase',
        ['U'] = 'UpperCase',
        ['t'] = 'Title Case',
        ['s'] = 'Sentence case',
        ['<space>'] = 'space case',
        ['-'] = 'dash-case or kebab-case',
        ['k'] = 'dash-case or kebab-case',
        ['K'] = 'Title-Dash-Case or Title-Kebab-Case',
        ['.'] = 'dot.case',
    },
}
wk.register(wk_map, wk_opt)

local visual_opt = {
    mode = 'v',
    prefix = '<CR>',
}
local visual_map = {
    k = {
        name = 'Change Case',
        ['m'] = 'MixedCase or PascalCase',
        ['p'] = 'MixedCase or PascalCase',
        ['c'] = 'camelCase',
        ['_'] = 'snake_case',
        ['u'] = 'UpperCase',
        ['U'] = 'UpperCase',
        ['t'] = 'Title Case',
        ['s'] = 'Sentence case',
        ['<space>'] = 'space case',
        ['-'] = 'dash-case or kebab-case',
        ['k'] = 'dash-case or kebab-case',
        ['K'] = 'Title-Dash-Case or Title-Kebab-Case',
        ['.'] = 'dot.case',
    },
}
wk.register(visual_map, visual_opt)
