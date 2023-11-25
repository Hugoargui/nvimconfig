return {
    'Weissle/persistent-breakpoints.nvim',
    enabled = require('core.enable_plugins').persistent_breakpoints,
    event = { 'BufReadPost' },
    opts = { load_breakpoints_event = { 'BufReadPost' } },
}
