local icons = require('core.icons').icons
return {
    enabled = require('core.enable_plugins').nvim_tree,
    'nvim-tree/nvim-tree.lua',
    -- keys = { '<leader>e' },
    -- keys = {
    --     '<leader>e',
    --     '<cmd>NvimTreeToggle<cr>',
    --     desc = 'Toggle File Explorer',
    --     silent = true,
    -- },

    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        -- recommended settings from nvim-tree documentation
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle File Explorer' }) -- got to declaration
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.g.nvim_tree_auto_close = 1 -- Doesn't do anything
        vim.g.nvim_tree_respect_buf_cwd = 1
        -- For FileTree to change automatically to our current dir
        -- We need to autosetup cwd every time we change folder!
        -- autocmd BufEnter * silent! lcd %:p:h
        -- vim.api.nvim_create_autocmd({ "BufEnter" }, { command = "lcd %:p:h" })

        require('nvim-tree').setup({

            -- Close if it's the last window
            -- autoclose = true, -- It says option doesnt exists
            -- open_on_setup = true,
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            view = {
                side = 'left',
                width = 40,
                -- auto_resize = true, -- nvim says this is an unknown option
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = '⮞', -- arrow when folder is closed
                            arrow_open = '⮟', -- arrow when folder is open
                        },
                        git = icons.gitFiles,
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

        --TODO: this breaks in nvim 0.9+
        -- local hydra_enabled = require('core.enable_plugins').hydra
        local hydra_enabled = false
        if hydra_enabled then
            -- -- auto show hydra on nvimtree focus
            local api = require('nvim-tree.api')
            local lib = require('nvim-tree.lib')
            local view = require('nvim-tree.view')

            local function change_root_to_global_cwd()
                local global_cwd = vim.fn.getcwd()
                -- local global_cwd = vim.fn.getcwd(-1, -1)
                api.tree.change_root(global_cwd)
            end

            local hint = [[
         _y_: Copy Name              _r_: Rename File     _P_: Navigate to Parent        _/_: Filter
         _Y_: Copy Relative Path     _e_: Rename Base     _K_: First Sibling             _H_: Toggle Hidden Files ^
         _c_: Copy File              _a_: Add New File    _J_: Last Sibling
         _x_: Cut File               _d_: Delete File     _W_: Collapse All
         _p_: Paste File             ^^                   _E_: Expand All                _?_: Help
         ^
        ]]

            local nvim_tree_hydra = nil
            local nt_au_group = vim.api.nvim_create_augroup('NvimTreeHydraAu', { clear = true })

            local Hydra = require('hydra')
            local function spawn_nvim_tree_hydra()
                nvim_tree_hydra = Hydra({
                    name = 'NvimTree',
                    hint = hint,
                    config = {
                        color = 'pink',
                        invoke_on_body = true,
                        buffer = 0, -- only for active buffer
                        hint = {
                            position = 'bottom',
                            border = 'rounded',
                        },
                    },
                    mode = 'n',
                    body = 'H',
                    heads = {
                        { 'y', api.fs.copy.filename, { silent = true } },
                        { 'Y', api.fs.copy.relative_path, { silent = true } },
                        { '/', api.live_filter.start, { silent = true } },
                        { 'c', api.fs.copy.node, { silent = true } },
                        { 'x', api.fs.cut, { exit = true, silent = true } },
                        { 'p', api.fs.paste, { exit = true, silent = true } },
                        { 'r', api.fs.rename, { silent = true } },
                        { 'd', api.fs.remove, { silent = true } },
                        { 'a', api.fs.create, { silent = true } },
                        { 'e', api.fs.rename_basename, { silent = true } },
                        { 'H', api.tree.toggle_hidden_filter, { silent = true } },
                        { '?', api.tree.toggle_help, { silent = true } },
                        { 'P', api.node.navigate.parent, { silent = true } },
                        { 'J', api.node.navigate.sibling.last, { silent = true } },
                        { 'K', api.node.navigate.sibling.first, { silent = true } },
                        { 'E', api.tree.expand_all, { silent = true } },
                        { 'W', api.tree.collapse_all, { silent = true } },
                    },
                })
                nvim_tree_hydra:activate()
            end

            vim.api.nvim_create_autocmd({ 'BufEnter' }, {
                pattern = '*',
                callback = function(opts)
                    -- print('leave: ft ' .. vim.bo[opts.buf].filetype)
                    if vim.bo[opts.buf].filetype == 'NvimTree' then
                        spawn_nvim_tree_hydra()
                    else
                        -- print('au close hydra')
                        if nvim_tree_hydra then
                            nvim_tree_hydra:exit()
                        end
                        -- return true -- removes autocmd
                    end
                end,
                group = nt_au_group,
            })
        end -- END if hydra_enabled

        -- STARTED PLAYING WITH HIDDING CURSOR IN NVIMTRE, but gave up, not so important
        -- vim.api.nvim_create_autocmd('FileType', {
        --     pattern = 'NvimTree',
        --     group = 'NvimTree',
        --     callback = function()
        --         --         -- vim.api.nvim_set_hl(0, 'NoiceHiddenCursor', { link = 'CursorLine' })
        --         vim.go.guicursor = 'a:NoiceHiddenCursor/NoiceHiddenCursor'
        --         --         -- vim.go.guicursor = ''
        --     end,
        -- })
        -- -- vim.api.nvim_create_autocmd('Filetype', {
        -- -- pattern = '*',
        -- -- group = 'NvimTreeExit',
        -- -- command = [[ if &ft != NvimTre | echo "do something" | endif]],
        -- -- })
    end,
}
