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

        if (vim.fn.has('win32')) then
            -- Check if 'pwsh' is executable and set the shell accordingly
            if vim.fn.executable('pwsh') == 1 then
                vim.o.shell = 'pwsh'
            else
                vim.o.shell = 'powershell'
            end

            -- Setting shell command flags
            vim.o.shellcmdflag =
            '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[\'Out-File:Encoding\']=\'utf8\';'

            -- Setting shell redirection
            vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

            -- Setting shell pipe
            vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

            -- Setting shell quote options
            vim.o.shellquote = ''
            vim.o.shellxquote = ''
        end

        toggleterm.setup({
            hide_numbers = true,
            start_in_insert = true,
            -- 	insert_mappings = true,
            persist_size = true,
            persist_mode = true,
            autochdir = false,
        })

        function _G.set_terminal_keymaps()
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-h>', [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-k>', [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-l>', [[<C-\><C-n><C-W>l]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-C-h>', [[<C-\><C-n>require('smart-splits').resize_left]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-C-j>', [[<C-\><C-n>require('smart-splits').resize_down]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-C-k>', [[<C-\><C-n>require('smart-splits').resize_up]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<A-C-l>', [[<C-\><C-n>require('smart-splits').resize_right]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
}
