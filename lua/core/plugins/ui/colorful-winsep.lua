return {
    'nvim-zh/colorful-winsep.nvim',
    enabled = require('core.enable_plugins').winsep,
    event = { 'WinNew' },
    config = function()
        require('colorful-winsep').setup({
            highlight = {
                guifg = '#1f3442',
                guibg = '#1F3442',
            },
            -- timer refresh rate
            interval = 30,
            --     -- This plugin will not be activated for filetype in the following table.
            -- no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
            no_exec_files = { 'packer', 'TelescopePrompt', 'mason', 'CompetiTest' },
            -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
            symbols = { '━', '┃', '┏', '┓', '┗', '┛' },
            close_event = function()
                -- Executed after closing the window separator
            end,
            create_event = function()
                -- Executed after creating the window separator
                -- Don't dispaly if there are only 2 windows (it's an ugly up-down split)
                if vim.fn.winnr('$') == 3 then
                    require('colorful-winsep').NvimSeparatorDel()
                end
            end,
        })
    end,
}
