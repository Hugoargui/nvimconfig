-- vim.api.nvim_set_keymap("n", "ya", "<Plug>(nvim-surround-insert)", { noremap = false, silent = true, desc = "Align" })
-- vim.api.nvim_set_keymap(
-- "n",
-- "ya",
-- "<Plug>(nvim-surround-insert-line)",
-- { noremap = false, silent = true, desc = "Align" }
-- )
-- this breaks
require('nvim-surround').setup({
    keymaps = { -- If i do them here, I can't set the description and the default is too verbose for which-key
        normal = false,
        normal_line = false,
        normal_cur_line = false, --"ySS",
        delete = false, --"ds",
        change = false, --"cs",

        insert = false, --"<C-g>s",
        insert_line = false, --"<C-g>S",
        visual = false, --'S',
        visual_line = false, --"gS",
    },
    -- For them to show properly in whichkey we define them ourselves
})
vim.api.nvim_set_keymap(
    'n',
    '<CR>s',
    '<Plug>(nvim-surround-normal)',
    { noremap = false, silent = true, desc = 'Surround' }
)
vim.api.nvim_set_keymap(
    'n',
    '<CR>S',
    '<Plug>(nvim-surround-normal-line)',
    { noremap = false, silent = true, desc = 'Surround with delimiters in new line' }
)
vim.api.nvim_set_keymap(
    'n',
    '<CR>d',
    '<Plug>(nvim-surround-delete)',
    { noremap = false, silent = true, desc = 'Delete surrounding' }
)
vim.api.nvim_set_keymap(
    'n',
    '<CR>r',
    '<Plug>(nvim-surround-change)',
    { noremap = false, silent = true, desc = 'Replace Surrounding' }
)

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

-- vim.keymap.set("n", "<CR>kp", "<Plug>(CaserMixedCase)")
-- vim.keymap.set("n", "<CR>kc", "<Plug>(CaserCamelCase)")
-- vim.keymap.set("n", "<CR>ks", "<Plug>(CaserSnakeCase)")
-- vim.keymap.set("n", "<CR>ku", "<Plug>(CaserUpperCase)")

-- Until I figure out wat this does
-- vim.api.nvim_set_eymap(
-- 	"n",
-- 	"ya",
-- 	"<Plug>(nvim-surround-normal-cur)",
-- 	{ noremap = false, silent = true, desc = "Align" }
-- )

-- until I figure out what to do in visual mode
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"ys",
-- 	"<Plug>(nvim-surround-normal-cur-line)",
-- 	{ noremap = false, silent = true, desc = "Align" }
-- )
-- vim.api.nvim_set_keymap("n", "ya", "<Plug>(nvim-surround-visual)", { noremap = false, silent = true, desc = "Align" })
--
-- vim.api.nvim_set_keymap(
-- "n",
-- "ya",
-- "<Plug>(nvim-surround-visual-line)",
-- { noremap = false, silent = true, desc = "Align" }
-- )
