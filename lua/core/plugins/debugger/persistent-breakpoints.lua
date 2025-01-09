return {
    'Weissle/persistent-breakpoints.nvim',
    enabled = require('core.enable_plugins').dap,
    event = { 'BufReadPost' },
    opts = { load_breakpoints_event = { 'BufReadPost' } },
}
