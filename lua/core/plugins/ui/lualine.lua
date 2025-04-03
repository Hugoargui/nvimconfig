local icons = require('core.icons').icons

local function simplifiedMode(str)
    local icon = '  '
    if str == 'INSERT' then
        icon = '  '
    elseif str == 'NORMAL' then
        icon = '󰆤  '
    elseif str == 'V-LINE' or str == 'V-BLOCK' or str == 'VISUAL' then
        icon = '  '
    elseif str == 'COMMAND' then
        icon = '  '
    end
    return icon .. (str == 'V-LINE' and 'VL' or (str == 'V-BLOCK' and 'VB' or str:sub(1, 1)))
end

local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == '' then
        return 'Not Recording Any Macro'
    else
        return 'Recording @' .. recording_register
    end
end

local show_lsp_name = {
    function()
        local buf_ft = vim.api.nvim_get_option_value('filetype', { scope = 'local' })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
            return 'No Active Lsp'
        else
            local msg = nil
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                -- Prep filetypes for indexing, some language servers only register with a single filetype so we need to
                -- convert them into a blob so vim.fn.index doesn't throw a fit
                if type(filetypes) == 'string' then
                    filetypes = { filetypes }
                end

                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    if not msg then
                        msg = client.name
                    else
                        msg = msg .. ', ' .. client.name
                    end
                end
            end
            return msg or 'No Active Lsp'
        end
    end,
    icon = ' LSP:',
    color = { fg = '#957fb8' },
}
local function customLocation(str)
    return 'Line: ' .. string.gsub(str, '%w+', '%1' .. '/%%L', 1)
end

-- For progress, if we want to add a fancy icon
local function customProgress(str)
    -- return ' ' .. str
    return str
end

local M = {
    'nvim-lualine/lualine.nvim',
    -- enabled = require('core.enable_plugins').lualine,
    enabled = true,
    event = 'VeryLazy',
    opts = function()
        local macro_refresh_places = { 'statusline', 'winbar' }
        vim.api.nvim_create_autocmd('RecordingEnter', {
            callback = function()
                require('lualine').refresh({
                    place = macro_refresh_places,
                })
            end,
        })

        vim.api.nvim_create_autocmd('RecordingLeave', {
            callback = function()
                require('lualine').refresh({
                    place = macro_refresh_places,
                })
            end,
        })

        vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
            pattern = '*',
            callback = function()
                require('lualine').loaded = nil
            end,
        })

        return {
            options = {
                theme = 'auto',
                globalstatus = true,
                -- component_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = simplifiedMode,
                    },
                },
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                    },
                },
                lualine_c = {
                    {
                        'diagnostics',
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                    },
                    {
                        'filetype',
                        icon_only = true,
                        separator = '',
                        padding = { left = 1, right = 0 },
                        cond = function()
                            local buffPath = vim.api.nvim_buf_get_name(0)
                            return not string.find(buffPath, 'NvimTree')
                        end,
                    },
                    {
                        'filename',
                        -- path options:
                          -- 0: Just the filename
                          -- 1: Relative path
                          -- 2: Absolute path
                          -- 3: Absolute path, with tilde as the home directory
                          -- 4: Filename and parent dir, with tilde as the home directory
                        path = 0,
                        symbols = { modified = '[+]', readonly = '🔒', unnamed = '' },
                        cond = function()
                            local buffPath = vim.api.nvim_buf_get_name(0)
                            return not string.find(buffPath, 'NvimTree')
                        end,
                    },

                    {
                        function()
                            return require('nvim-navic').get_location()
                        end,
                        cond = function()
                            return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
                        end,
                    },
                },
                lualine_x = {
                    {
                        'macro-recording',
                        color = {
                            fg = '#FF9E3B',
                        },
                        fmt = show_macro_recording,
                    },
                    show_lsp_name,
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                    },
                },
                lualine_y = {
                    {
                        'location',
                        fmt = customLocation,
                    },
                    {
                        'progress',
                        fmt = customProgress,
                    },
                },
                lualine_z = {
                    function()
                        return ' ' .. os.date('%R')
                    end,
                },
            },
            extensions = { 'neo-tree', 'lazy' },
        }
    end,
}
return M
