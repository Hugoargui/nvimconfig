local M = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    -- Setup {{{*/
    local setup = {
      plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      -- operators = { gc = "Comment", ys = "Surround", yr = "Replace surround", yd = "Delete Surround", ya = "Align" },
      operators = { gc = 'Comment', ys = 'Surround', yr = 'Replace surround', yd = 'Delete Surround', ya = 'Align' },
      show_keys = true,

      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        -- separator = ">", -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
      },
      window = {
        border = 'rounded', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = 'left', -- align columns left, center or right
      },
      ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
      hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = 'auto', -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { 'j', 'k' },
        v = { 'j', 'k' },
      },
    }
    --}}}

    -----------------------------------------------------------------------------------------------------------------
    -- Lader mappings {{{*/
    local leader_opts = {
      mode = 'n', -- NORMAL mode
      prefix = '<leader>',
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local leader_mappings = {
      -- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
      ['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
      ['c'] = { '<cmd>Telescope colorscheme<cr>', 'Colorshemes' },
      -- ["w"] = { "<cmd>w!<CR>", "Save" },
      ['q'] = { '<cmd>qa!<CR>', 'Quit' },
      -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ['h'] = { '<cmd>Telescope highlights<CR>', 'Search Highligts' },
      ['r'] = { '<cmd>Telescope resume<CR>', 'RESUME last search' },
      ['f'] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        'Find files',
      },
      ['F'] = { '<cmd>Telescope find_files<cr>', 'Find Files with preview' },
      ['s'] = { '<cmd>Telescope live_grep<cr>', 'Find Text' },

      x = {
        name = 'Session Management',
        ['x'] = { '<cmd>SearchSession<cr>', 'Search Session' },
        ['s'] = { '<cmd>SaveSession<cr>', 'Save or Create session' },
        ['d'] = { '<cmd>Autosession delete<cr>', 'Delete Sessions' },
        ['c'] = { '<cmd>cd %:p:h <cr>', 'Change working directory to the location of the current file' },
      },

      w = {
        name = 'Window  management',
        ['v'] = { '<c-w>v<cr>', 'Split vertically' },
        ['h'] = { '<C-w>s>', 'Split horizontally' },
        ['e'] = { '<C-w> =<CR>', 'Make splits equal size' },
        ['x'] = { '<cmd>close<CR>', 'Close current window' },
        ['s'] = { '<C-q>', 'Toggle Shade' },
        ['o'] = { '<cmd>only<CR>', 'Close all other windows' },
        ['f'] = { '<cmd>MaximizerToggle<CR>', 'Maximizer Toggle' },
      },

      v = {
        name = 'Vim config files',
        ['v'] = { '<cmd>source %<cr>', 'Source this file' },
        ['a'] = { '<cmd>source ~/.config/nvim/init.lua<cr>', 'Source all' },
        ['i'] = { '<cmd>e ~/.config/nvim/init.lua<CR>', 'Jump to init.lua' },
        ['k'] = { '<cmd>e ~/.config/nvim/lua/user/core/keymaps.lua<CR>', 'Jump to keymaps' },
        ['o'] = { '<cmd>e ~/.config/nvim/lua/user/core/options.lua<CR>', 'Jump to options' },
        ['p'] = { '<cmd>e ~/.config/nvim/lua/user/plugins-setup.lua<CR>', 'Jump to plugins' },
      },

      g = {
        name = 'Git',
        g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', 'Lazygit' },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", 'Next Hunk' },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", 'Prev Hunk' },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", 'Blame' },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", 'Reset Hunk' },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", 'Reset Buffer' },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", 'Stage Hunk' },
        u = {
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
          'Undo Stage Hunk',
        },
        o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
        b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
        d = {
          '<cmd>Gitsigns diffthis HEAD<cr>',
          'Diff',
        },
      },

      m = {
        name = 'Make/Build',
      },
      l = {
        name = 'LSP',
      },
      i = {
        name = 'Diagnostics',
      },
      d = {
        name = 'Debugger',
      },
      S = {
        name = 'Search',
        b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
        h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
        M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
        R = { '<cmd>Telescope registers<cr>', 'Registers' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        C = { '<cmd>Telescope commands<cr>', 'Commands' },
      },

      -- t = {
      -- name = "Tabs and Terminals",
      -- name = "Tabs / Window Layouts",
      -- terminals with learder keys cause problems (not so easy to toggle as with ctrl. For now try to have them on ctrl)
      -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      -- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      -- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      -- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      -- f = { "<cmd>ToggleTerm direction=float<cr>", "Float Terminal" },
      -- h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal Terminal" },
      -- v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical Terminal" },
      -- },
    }

    require('which-key').setup(setup)
    require('which-key').register(leader_mappings, leader_opts)
    --}}}
  end,
}

return M
