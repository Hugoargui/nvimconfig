return {
    -- This plugin adds highlights for text filetypes, like markdown, orgmode, and neorg.
    'lukas-reineke/headlines.nvim',
    enabled = require('core.enable_plugins').headlines,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true, -- or `opts = {}`
}
