return {
    'linty-org/readline.nvim',
    event = 'InsertEnter',
    enabled = require('core.enable_plugins').readline,
    config = function()
        local readline = require('readline')

        vim.keymap.set('!', '<M-o>', '<Esc>o')
        vim.keymap.set('!', '<M-O>', '<Esc>O')

        -- MOVEMENT
        vim.keymap.set('!', '<C-b>', '<Left>')
        vim.keymap.set('!', '<M-b>', readline.backward_word)

        vim.keymap.set('!', '<C-f>', '<Right>')
        vim.keymap.set('!', '<M-f>', readline.forward_word)

        vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
        vim.keymap.set('!', '<C-e>', readline.end_of_line)

        -- KILL
        -- vim.keymap.set('!', '<C-h>', readline.backward_kill_word)
        vim.keymap.set('!', '<C-h>', '<BS>')
        vim.keymap.set('!', '<M-h>', readline.backward_kill_word)
        vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)

        vim.keymap.set('!', '<C-d>', '<Del>')
        vim.keymap.set('!', '<M-d>', readline.kill_word)

        vim.keymap.set('!', '<C-k>', readline.kill_line)
        vim.keymap.set('!', '<C-u>', readline.backward_kill_line)

        -- vim.keymap.set('!', '<C-d>', '<esc>yypgi') -- Duplicate current line bellow -- but C-d removes one level of indention
        -- vim.keymap.set('!', '<C-l>', '<C-o>dd') -- delete current line
    end,
}
