return {
    'akinsho/toggleterm.nvim',
    enabled = require('core.enable_plugins').toggleterm,
    keys = { '<c-f>', '<m-t>', '<c-t>' },
    config = function()
        local toggleterm = require('toggleterm')
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<c-f>', ':ToggleTerm direction=float dir=%:p:h<cr>', opts)
        vim.keymap.set('t', '<c-f>', [[<C-\><C-n>:ToggleTerm<cr>]], opts) -- this assumes the terminal keymap already sets <esc> to <C-\><C-n>
        vim.keymap.set('n', '<m-t>', ':ToggleTerm direction=vertical size=80 dir=%:p:h<cr>', opts)
        vim.keymap.set('t', '<m-t>', [[<C-\><C-n>:ToggleTerm<cr>]], opts) -- this assumes the terminal keymap already sets <esc> to <C-\><C-n>
        vim.keymap.set('n', '<c-t>', ':ToggleTerm direction=horizontal dir=%:p:h<cr>', opts)
        vim.keymap.set('t', '<c-t>', [[<C-\><C-n>:ToggleTerm<cr>]], opts) -- this assumes the terminal keymap already sets <esc> to <C-\><C-n>

        toggleterm.setup({
            hide_numbers = true,
            start_in_insert = true,
            -- 	insert_mappings = true,
            persist_size = true,
            persist_mode = true,
            autochdir = false,

            on_create = function(term)
                print(term.dir)
            end,
        })

        function _G.set_terminal_keymaps()
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
}
