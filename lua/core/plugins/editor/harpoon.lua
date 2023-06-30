return {
    'ThePrimeagen/harpoon',
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
            "''",
            ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
            silent = true,
            remap = false,
            desc = 'Open Harpoon Menu',
        },
        { "'a", ":lua require('harpoon.ui').nav_file(1)<CR>", silent = true, remap = false, desc = 'Harpoon File 1' },
        { "'s", ":lua require('harpoon.ui').nav_file(2)<CR>", silent = true, remap = false, desc = 'Harpoon File 2' },
        { "'d", ":lua require('harpoon.ui').nav_file(3)<CR>", silent = true, remap = false, desc = 'Harpoon File 3' },
        { "'f", ":lua require('harpoon.ui').nav_file(4)<CR>", silent = true, remap = false, desc = 'Harpoon File 4' },
    },
}
