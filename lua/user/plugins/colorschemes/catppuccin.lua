-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
--
-- if not status then
-- 	print("Colorscheme not found!") -- print error if colorscheme not installed
-- 	return
-- end

require('catppuccin').setup({
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.5,
  },
  integrations = {
    aerial = true,
    barbar = false,
    beacon = false,
    cmp = true,
    coc_nvim = false,
    dashboard = true,
    fern = false,
    fidget = false,
    gitgutter = false,
    gitsigns = true,
    harpoon = false,
    headlines = false,
    hop = false,
    illuminate = false,
    leap = false,
    lightspeed = false,
    lsp_saga = true,
    lsp_trouble = true,
    markdown = true,
    mason = true,
    mini = false,
    neogit = false,
    neotest = false,
    neotree = false,
    noice = true,
    notify = true,
    nvimtree = true,
    octo = false,
    overseer = false,
    pounce = false,
    sandwich = false,
    semantic_tokens = true,
    symbols_outline = false,
    telekasten = false,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    -- ts_rainbow = true,
    -- ts_rainbow2 = true,
    vim_sneak = false,
    vimwiki = false,
    which_key = true,

    -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
    barbecue = {
      dim_dirname = true,
      bold_basename = true,
      dim_context = false,
      alt_background = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
    navic = {
      enabled = false,
      custom_bg = 'NONE',
    },
  },
})
