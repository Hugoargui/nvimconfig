-- Better looking code actions menu than default
return {
    'weilbith/nvim-code-action-menu',
    enabled = require('core.enable_plugins').code_action_menu,

    cmd = { 'CodeActionMenu' },
    keys = {
        -- Set together with the reast of LSP mappings
    },
    config = function()
        vim.g.code_action_menu_show_details = false
        vim.g.code_action_menu_show_diff = false -- doesn't seem to work
        vim.g.code_action_menu_show_action_kind = true
    end,
}
