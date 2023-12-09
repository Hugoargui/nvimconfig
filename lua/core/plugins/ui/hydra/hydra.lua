return {
    'anuvyklack/hydra.nvim',
    enabled = require('core.enable_plugins').hydra,
    lazy = true,
    keys = { '<leader>e', '~', 'z', '<leader>w' },
    dependencies = {
        'anuvyklack/keymap-layer.nvim',
    },
    config = function()
        -- require('core.plugins.ui.hydra.hydra_menus.folds') -- not working
        require('core.plugins.ui.hydra.hydra_menus.toggle_options')
        require('core.plugins.ui.hydra.hydra_menus.window_manager')
    end,
}
