-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end
-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_auto_close = 1 -- Doesn't do anything
-- configure nvim-tree
nvimtree.setup({
  -- Close if it's the last window
  -- autoclose = true, -- Doesn't do anything
  -- open_on_setup = true,
  view = {
    side = "left",
    width = 30,
    -- auto_resize = false
  },
  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "⮞", -- arrow when folder is closed
          arrow_open = "⮟", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for explorer to work well with window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  -- 	git = {
  -- 		ignore = false,
  -- 	},
})

