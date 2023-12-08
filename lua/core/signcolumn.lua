local icons = require('core.icons').icons

-- CUSTOM COLUMN HELPER FUNCTIONS
local function get_sign_name(cur_sign)
    if cur_sign == nil then
        return 'nil sign'
    end

    cur_sign = cur_sign[1]

    if cur_sign == nil then
        return 'nil sign[1]'
    end

    cur_sign = cur_sign.signs

    if cur_sign == nil then
        return nil
    end

    cur_sign = cur_sign[1]

    if cur_sign == nil then
        return nil
    end

    return cur_sign['name']
end
local function get_name_from_group(bufnum, lnum, group)
    local cur_sign_tbl = vim.fn.sign_getplaced(bufnum, {
        group = group,
        lnum = lnum,
    })
    return get_sign_name(cur_sign_tbl)
end
local function mk_hl(group, sym)
    return table.concat({ '%#', group, '#', sym, '%*' })
end

--- GIT CUSTOM COLUMN
local gitsigns_bar = '▌'
local gitsigns_hl_pool = {
    GitSignsAdd = 'DiagnosticOk',
    GitSignsChange = 'DiagnosticWarn',
    GitSignsChangedelete = 'DiagnosticWarn',
    GitSignsDelete = 'DiagnosticError',
    GitSignsTopdelete = 'DiagnosticError',
    GitSignsUntracked = 'NonText',
}
_G.get_statuscol_gitsign = function(bufnr, lnum)
    local cur_sign_nm = get_name_from_group(bufnr, lnum, 'gitsigns_vimfn_signs')
    if cur_sign_nm ~= nil then
        return mk_hl(gitsigns_hl_pool[cur_sign_nm], gitsigns_bar)
    else
        return ' '
    end
end

-- DIAG CUSTOM COLUMN
local diag_signs_icons = {
    DiagnosticSignError = icons.diagnostics.Error,
    DiagnosticSignWarn = icons.diagnostics.Warn,
    DiagnosticSignHint = icons.diagnostics.Hint,
    DiagnosticSignInfo = icons.diagnostics.Info,
    DiagnosticSignOk = icons.diagnostics.Ok,
}

_G.get_statuscol_diag = function(bufnum, lnum)
    local cur_sign_nm = get_name_from_group(bufnum, lnum, '*')

    if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, 'DiagnosticSign') then
        return mk_hl(cur_sign_nm, diag_signs_icons[cur_sign_nm])
    else
        return ' '
    end
end

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local defaultSignColumn = '%#LineNr#' .. '%s'
local customDiagnosticsColumn = '%#LineNr#' .. '%{%v:lua.get_statuscol_diag(bufnr(), v:lnum)%}'
local customGitColumn = '%#LineNr#' .. '%{%v:lua.get_statuscol_gitsign(bufnr(), v:lnum)%}'
-- local numColumn = '%#LineNr#' .. '%l'
local numColumn = '%l'
-- local foldColumn = '%#LineNr#' .. '%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }'
local foldColumn = '%#LineNr#'
    .. '%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }'

-- Each '%=' is a separator point between sections, for alignment of scaces (ie, diagnostics more right on shorter line numbers, etc)
vim.o.statuscolumn = '%=' .. customDiagnosticsColumn .. '%=' .. numColumn .. defaultSignColumn .. foldColumn

-- vim.o.statuscolumn = '%=%l%s%C'
-- vim.opt.statuscolumn = [[%!v:lua.Status.column()]]

-- vim.opt.fillchars:append({ fold = ' ' })
-- vim.opt.fillchars:append({ foldopen = '' })
-- vim.opt.fillchars:append({ foldclose = '' })
