return {
    'akinsho/toggleterm.nvim',
    keys = { '<c-f>', '<m-t>', '<c-t>' },
    config = function()
        local toggleterm = require('toggleterm')
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<c-f>', ':ToggleTerm direction=float<cr>', opts)
        vim.keymap.set('t', '<c-f>', [[<C-\><C-n>:ToggleTerm<cr>]], opts) -- this assumes the terminal keymap already sets <esc> to <C-\><C-n>
        vim.keymap.set('n', '<m-t>', ':ToggleTerm direction=vertical size=80<cr>', opts)
        vim.keymap.set('t', '<m-t>', [[<C-\><C-n>:ToggleTerm<cr>]], opts) -- this assumes the terminal keymap already sets <esc> to <C-\><C-n>
        vim.keymap.set('n', '<c-t>', ':ToggleTerm direction=horizontal<cr>', opts)
        vim.keymap.set('t', '<c-t>', [[<C-\><C-n>:ToggleTerm<cr>]], opts) -- this assumes the terminal keymap already sets <esc> to <C-\><C-n>
        -- From reddit example:
        -- nnoremap <silent> <Leader>t   :FloatermToggle<CR>
        -- tnoremap <silent> <Leader>t   <C-\><C-n>:FloatermToggle<CR>
        toggleterm.setup({
            -- size = function(term)
            -- if term.direction == "horizontal" then
            -- return 40
            -- elseif term.direction == "vertical" then return vim.o.columns 0.4
            -- end
            -- open_mapping = [[<c-\>]],
            -- open_mapping = [[<c-f>]], -- if we do it from here, when we do other directions with another shortcut, the default isn't horizontal anymore, do mappings from outside
            hide_numbers = true,
            -- 	shade_filetypes = {},
            -- 	shade_terminals = true,
            -- 	shading_factor = 2,
            start_in_insert = true,
            -- 	insert_mappings = true,
            persist_size = true,
            -- direction = "horizontal",
            -- 	close_on_exit = true,
            -- 	shell = vim.o.shell,
            -- 	float_opts = {
            -- 		border = "curved",
            -- 		winblend = 0,
            -- 		highlights = {
            -- 			border = "Normal",
            -- 			background = "Normal",
            -- 		},
            -- 	},
        })

        function _G.set_terminal_keymaps()
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
            -- vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
            cmd = 'lazygit',
            hidden = true,
            direction = 'float',
        })

        function _LAZYGIT_TOGGLE()
            lazygit:toggle()
        end

        -- local python = Terminal:new({ cmd = "python", hidden = true })
        --
        -- function _PYTHON_TOGGLE()
        -- 	python:toggle()
        -- end
        --
        --
        --

        -- code
    end,
}
