-- -- FOLDING without any plugin
-- vim.o.foldlevel = 99 -- 0-> Start all folded, 99 start all unfolded
-- -- opt.foldmethod = "indent"
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- function _G.custom_fold_text()
--   local lineText = vim.fn.getline(vim.v.foldstart)
--   local numOfLines = vim.v.foldend - vim.v.foldstart + 1
--   local fillCount = vim.fn.winwidth('%') - vim.fn.len(lineText) - vim.fn.len(numOfLines) - 17
--
--   -- return "[" .. numOfLines .. "] lines folded: " .. lineText
--   return '+ ' .. lineText .. ' ... ' .. '[' .. numOfLines .. ' lines folded] '
-- end
-- vim.opt.foldtext = 'v:lua.custom_fold_text()'
-- -- vim.opt.fillchars:append({fold = " "}) -- Remove trailing whitespaces

-- ********************************************************************************************************
-- FoldiNG using nvim-ufo plugin
vim.o.foldcolumn = '0' -- '0' for nothing, '1' is also not bad
vim.o.foldlevel = 99 -- Using ufo provider needs a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
-- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
-- --
--
local foldTextFormatter = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('...[%d lines folded]'):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  event = 'BufReadPost',
  -- keys = {
  --   { 'zR', 'require('ufo').openAllFolds', desc = 'Open All Folds' },
  --   { 'zR', 'require('ufo').closeAllFolds', desc = 'Close All Folds' },
  -- },
  opts = {
    provider_selector = function()
      return { 'treesitter', 'indent' }
    end,
    -- open opening the buffer, close these fold kinds
    -- use `:UfoInspect` to get available fold kinds from the LSP
    close_fold_kinds = { 'imports' },
    open_fold_hl_timeout = 500,
    fold_virt_text_handler = foldTextFormatter,
  },
}
