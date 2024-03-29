return {
    'ThePrimeagen/harpoon',
    enabled = require('core.enable_plugins').harpoon,
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        {
            "'<space>",
            ":lua require('harpoon.mark').add_file()<CR>",
            silent = true,
            remap = false,
            desc = 'Add File To Harpoon',
        },
        {
            "'x",
            ":lua require('harpoon.mark').rm_file()<CR>",
            silent = true,
            remap = false,
            desc = 'Remove File From Harpoon',
        },
        -- {
        --     "''",
        --     ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
        --     silent = true,
        --     remap = false,
        --     desc = 'Open Harpoon Menu',
        -- },
        { "'a", ":lua require('harpoon.ui').nav_file(1)<CR>", silent = true, remap = false, desc = 'Harpoon File 1' },
        { "'s", ":lua require('harpoon.ui').nav_file(2)<CR>", silent = true, remap = false, desc = 'Harpoon File 2' },
        { "'d", ":lua require('harpoon.ui').nav_file(3)<CR>", silent = true, remap = false, desc = 'Harpoon File 3' },
        { "'f", ":lua require('harpoon.ui').nav_file(4)<CR>", silent = true, remap = false, desc = 'Harpoon File 4' },
        {
            "''",
            '<cmd>Telescope harpoon marks prompt_title="Bookmarks" <cr>',
            silent = true,
            remap = false,
            desc = 'Open Harpoon Menu',
        },
    },
    config = function()
        require('telescope').load_extension('harpoon')
    end,
}
