-- Moving windows around much better than defaults
return {
    -- smart-splits already includes a swap function, consider removing this plugin
    enabled = require('core.enable_plugins').winshift,
    'sindrets/winshift.nvim', -- used by hydra window=manager
    cmd = { 'WinShift' },
}
