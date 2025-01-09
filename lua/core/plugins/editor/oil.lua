return {
    'stevearc/oil.nvim',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter' },
        { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    keys = {
        {
            '<leader><leader>',
            '<cmd>Oil<CR>',
            desc = '  Filesystem Editor in this window',
        },
        {
            '<leader><cr>',
            '<cmd>lua require("oil").open_float()<CR>',
            desc = '  Filesystem Editor floating window',
        },
    },
    init = function()
        local netrw_bufname

        pcall(vim.api.nvim_clear_autocmds, { group = 'FileExplorer' })

        vim.api.nvim_create_autocmd('VimEnter', {
            pattern = '*',
            once = true,
            callback = function()
                pcall(vim.api.nvim_clear_autocmds, { group = 'FileExplorer' })
            end,
        })

        vim.api.nvim_create_autocmd('BufEnter', {
            group = vim.api.nvim_create_augroup('oil.nvim', { clear = true }),
            pattern = '*',
            callback = function()
                vim.schedule(function()
                    if vim.bo[0].filetype == 'netrw' then
                        return
                    end
                    local bufname = vim.api.nvim_buf_get_name(0)
                    if vim.fn.isdirectory(bufname) == 0 then
                        _, netrw_bufname = pcall(vim.fn.expand, '#:p:h')
                        return
                    end

                    -- prevents reopening of file-browser if exiting without selecting a file
                    if netrw_bufname == bufname then
                        netrw_bufname = nil
                        return
                    else
                        netrw_bufname = bufname
                    end

                    -- ensure no buffers remain with the directory name
                    local bufnr = vim.api.nvim_get_current_buf()
                    vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = bufnr })

                    require('oil').open_float()
                end)
            end,
            desc = 'oil.nvim replacement for netrw',
        })
    end,
    opts = {
        default_file_explorer = false,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name)
                return vim.startswith(name, '.DS_Store')
            end,
        },
        float = {
            padding = 4,
        },
    },
    config = function(_, opts)
        require('oil').setup(opts)
    end,
}
