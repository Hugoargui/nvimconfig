local Hydra = require('hydra')

local hint = [[
  ^^
  ^^                           FOLDS
  ^
    _M_ Close all Folds       _a_  Toggle Fold Under cursor  _m_ Fold more ^^^
    _R_ Open all Folds        _A_  Toggle All Folds cursor   _r_ Fold less ^^^
    ^^                        _o_  Close Fold Under cursor   ^
    ^^                        _O_  Close All Folds cursor
    ^^                        _c_  Close Fold Under cursor
    ^^                        _C_  Close All Folds cursor
  ^^^^  _<Esc>_  to cancel^^^^
]]

Hydra({
  name = 'Folds',
  hint = hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      border = 'rounded',
      position = 'middle',
    },
    on_enter = function()
      print('Hydra enter')
      -- vim.bo.modifiable = false -- temporary set `nomodifiable` while Hydra is active
    end,
  },
  mode = 'n',
  body = 'z',
  heads = {
    { 'a', 'za', { exit = true, silent = true } },
    { 'A', 'zA', { exit = true, silent = true } },
    { 'C', 'zC', { exit = true, silent = true } },
    { 'c', 'zc', { exit = true, silent = true } },

    { 'M', 'zM', { exit = true, silent = true } },
    { 'm', 'zm', { exit = true, silent = true } },
    { 'o', 'zo', { exit = true, silent = true } },
    { 'O', 'zO', { exit = true, silent = true } },
    { 'r', 'zr', { exit = true, silent = true } },
    { 'R', 'zR', { exit = true, silent = true } },

    { 'z', 'zz', { exit = true, silent = true } },
    { 'b', 'zb', { exit = true, silent = true } },
    { 't', 'zt', { exit = true, silent = true } },

    { '<Esc>', nil, { exit = true } },

    -- zx and zX do Undo manually opened and closed folds: re-apply 'foldlevel'.
    -- zi to enable/disable folds
    -- zn zN Fold none/normal...
    -- zF, zd, zD, zE crreate/eliminate folds manually
  }, -- Heads
})
