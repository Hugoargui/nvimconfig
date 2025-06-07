local M = {
    'folke/which-key.nvim',
    enabled = require('core.enable_plugins').whickhey,
    event = 'VeryLazy',
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
        "<leader>"
    },
    config = function()
        require("which-key").add({
            { "<leader>?", hidden = true },
            { "<leader>q", group = " ❌ Quit nVim" },
            { "<leader>a", group = "   C++ Plugins" },
            { "<leader>b", group = " 🟢 Make/Build" },
            { "<leader>m", group = "   Cmake" },
            { "<leader>d", group = "   Debugger" },
            { "<leader>i", group = "  Diagnostics" },
            { "<leader>o", group = " 🔔 Notifications" },
            { "<leader>t", group = "   Trouble Diagnostics" },
            { "<leader>l", group = "   LSP" },
            --     -- TODO:
            --     k = { name = ' LSP change symbol Case' },
            --     n = { name = 'LSP swap with next' },
            --     p = { name = 'LSP swap with previous' },
            { "<leader>s", group = "   Search" },
            {
                "<leader>ss",
                -- Taken from this issue https://github.com/nvim-telescope/telescope.nvim/issues/564
                function()
                    require('telescope.builtin').live_grep({
                        shorten_path = true,
                        word_match = '-w',
                        only_sort_text = true,
                        search = '',
                    })
                end,
                desc = "   FUZZY Find Text in project"
            },
            { "<leader>sh", "<cmd>Telescope highlights<CR>", desc = "  Search Highligts", mode = "n" },
            { "<leader>sH", "<cmd>Telescope help_tags<cr>", desc = "  Find Help", mode = "n" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "  Man Pages", mode = "n" },
            { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "  Open Recent File", mode = "n" },
            { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "  Registers", mode = "n" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "  Keymaps", mode = "n" },
            { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "󰘳  Commands", mode = "n" },
            { "<leader>sb", function() require('telescope.builtin').buffers({ sort_lastused = true }) end, desc = "󰷊  Buffers", mode = "n" },

            { "<leader>r", "<cmd>Telescope resume<CR>", desc = "  RESUME last search", mode = "n" },

            { "<leader>e", desc = "  Toggle File Explorer" },

            { "<leader>g", desc = " 󰊢 Git" },
            -- todo:    g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', ' Lazygit' },

            { "<leader>w", desc = "   Window  management" },

            { "<leader>x", desc = "   Session Management" },

            -- TODO: maybe only enable this if spellchecking is enabled in this buffer
            { "<leader>z", desc = " 󱀌  Spell Checking" },

        }) -- end of require("which-key").add({


        local setup = {
            win = {
                border = 'rounded', -- none, single, double, shadow
                padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3,                    -- spacing between columns
                align = 'center',               -- align columns left, center or right
            },
            icons = {
                rules = false, -- Disable default icons, I want manual control
            }
            -- sort = "manual",
        }

        -----------------------------------------------------------------------------------------------------------------
        require('which-key').setup(setup)
    end,
}

return M
