return {
    'AckslD/nvim-FeMaco.lua',
    ft = 'markdown',
    enabled = false, -- slows down cpp code block snippet expansion, deleting of those lines, etc
    config = function()
        local femaco = require('femaco')
        local clip_val = function(min, val, max)
            if val < min then
                val = min
            end
            if val > max then
                val = max
            end
            return val
        end
        femaco.setup({
            float_opts = function(code_block)
                return {
                    relative = 'cursor',
                    width = clip_val(5, 120, vim.api.nvim_win_get_width(0) - 10), -- TODO how to offset sign column etc?
                    height = clip_val(10, #code_block.lines, vim.api.nvim_win_get_height(0) - 6),
                    anchor = 'NW',
                    row = 0,
                    col = 0,
                    style = 'minimal',
                    border = 'rounded',
                    zindex = 1,
                }
            end,
        })

        local wk_enabled = require('core.enable_plugins').whichkey
        if wk_enabled then
            local wkl = require('which-key')
            vim.cmd('autocmd FileType markdown lua RegisterFemacoKeymap()')
            function RegisterFemacoKeymap()
                wkl.register({
                    name = '   Markdown specific actions',
                    ['f'] = { '<cmd>FeMaco<CR>', ' Edit Code Block in floating-window' },
                }, { prefix = '<leader>a', buffer = 0 })
            end
        else
            vim.keymap.set('n', '<leader>af', '<cmd>FeMaco<CR>', ' Edit Code Block in floating-window')
        end
    end,
}
