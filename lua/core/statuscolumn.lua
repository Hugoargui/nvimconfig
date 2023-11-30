local M = {}
_G.Status = M

---@return {name:string, text:string, texthl:string}[]
function M.get_signs()
    local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    return vim.tbl_map(function(sign)
        return vim.fn.sign_getdefined(sign.name)[1]
    end, vim.fn.sign_getplaced(buf, { group = '*', lnum = vim.v.lnum })[1].signs)
end

function M.column()
    local sign, git_sign
    for _, s in ipairs(M.get_signs()) do
        if s.name:find('GitSign') then
            git_sign = s
        else
            sign = s
        end
    end
    local components = {
        sign and ('%#' .. sign.texthl .. '#' .. sign.text .. '%*') or ' ',
        [[%=]],
        [[%{&nu?(&rnu&&v:relnum?v:relnum:v:lnum):''} ]],
        git_sign and ('%#' .. git_sign.texthl .. '#' .. git_sign.text .. '%*') or '  ',
    }
    return table.concat(components, '')
end

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.o.statuscolumn = '%=%l%s%C'
-- vim.opt.statuscolumn = [[%!v:lua.Status.column()]]
vim.o.statuscolumn =
    -- '%=%l%s%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }'
    -- '%=%s%l%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "  " : "  ") : "   " }'
    '%=%s%l%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "  " : "  ") : "   " }'

-- vim.opt.fillchars:append({ fold = ' ' })
-- vim.opt.fillchars:append({ foldopen = '' })
-- vim.opt.fillchars:append({ foldclose = '' })
return M
