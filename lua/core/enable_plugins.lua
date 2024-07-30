return {
    hydra = false,
    whichkey = false,
    -- CODING
    autolist = true,
    comment = true,
    cutlass = true,
    lsp_signature = false,
    lsp_inlayhints = true,
    luasnip = true,
    mini_surround = false,
    autopairs = true,
    bettern = false,
    nvim_cmp = true,
    spider = true,
    surround = false,
    cpptools = true,
    ts_context_comments = false,
    ouroboros = true,
    substitute = true,
    text_case = false,
    toggleterm = true,
    smartword = true,

    -- DEBUGGER
    dap = true,
    dapui = true,

    -- EDITOR
    colorizer = true,
    eyeliner = true,
    harpoon = true,
    headlines = false, -- Highlights for markdown, orgmode etc
    icon_picker = true,
    markdown_preview = true,
    md_headers = true,
    neoscroll = true,
    null_ls = false,
    nvim_tree = true,
    treesitter_textobjects = true,
    ufo = true,
    smart_splits = true,
    telescope = true,
    todo_comments = true,
    trouble = true,
    various_textobjects = true,
    bbye = true,
    vim_cmake = true,
    vim_maximizer = true,
    winshift = true,

    -- GIT
    gitsigns = true,
    fugitive = true,

    -- LSP
    lspsaga = true,
    mason = true, -- Not so long to load, but why waste time when I don't install stuff so often
    neodim = false, -- FIX: BREAKS HL, for example toggle line coments makes it white -- Highlihgt unused symbols
    code_action_menu = true, -- Pop up menu for code actions
    lspconfig = true,
    pretty_hover = true, --parses the hover message before opening the popup window
    symbols_outline = true, -- symbol outline sidebar
    symbol_usage = true, -- virtual text for symbol reference count
    navbuddy = true, -- Nice ranger like symbol navigator

    -- SESSIONS

    -- SYNTAX
    hlargs = false, -- NOT NEEDED WHEN SEMANTIC HL SUPPORT
    indentblankline = true,
    rainbow_delimiters = true,
    tree_sitter_asm = false, -- not used
    treesitter = true,
    treesitter_playground = false,
    illuminate = true,

    -- THEME

    -- UI
    cokeline = false,
    winsep = true,
    incline = false,
    lualine = true,
    noice = true,
    tint = true,
}
