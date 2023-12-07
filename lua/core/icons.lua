return {
    -- icons used by other plugins
    icons = {
        diagnostics = {
            Error = ' ',
            Warn = ' ',
            Hint = ' ',
            Info = ' ',
            Ok = ' ',
        },
        gitColumn = {
            add = { text = '│' }, --" ","▎"
            change = { text = '!' }, --" ",
            delete = { text = '_' }, --" ",""
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '┆' },
        },
        git = {
            added = ' ',
            modified = ' ',
            removed = ' ',
        },

        gitFiles = { -- The following are more for the filetree:
            unstaged = 'US', --'✗',
            staged = 'S', --'✓',
            unmerged = 'UM', -- '',
            renamed = 'R', --'➜',
            untracked = 'UT', -- '★',
            deleted = 'D', -- '',
            ignored = 'I', -- '◌',
        },

        kinds = {
            Array = ' ',
            Boolean = ' ',
            Class = ' ', --"󰠱 ",
            Color = '  ', --"󰏘 ", "󰸌 "
            Constant = ' ',
            Constructor = '',
            Copilot = ' ',
            Enum = ' ',
            EnumMember = '',
            Event = ' ', --"",
            Field = '󰄶 ', --"󰘻 ","󰄷 "
            File = '󰈙', -- 󰷈 󱪗 󱪝
            Folder = '  ', --󰉋  
            Function = '󰊕', --"󰡱 "
            Interface = ' ', --"",
            Keyword = '󰌋 ', --"󱕵"
            Method = '󰆧 ',
            Module = ' ',
            Namespace = ' ',
            Null = ' ',
            Number = ' ',
            Object = ' ',
            Operator = ' ', --"󰆕",
            Package = '󰏗 ',
            Property = ' ', --" ",󱉯
            Reference = ' ', --"",
            Snippet = ' ',
            String = ' ',
            Struct = ' ', --" ",
            Text = '󰊄 ', --" ",󰚞
            TypeParameter = ' ',
            Unit = ' ', --"",
            Value = '󰎠',
            Variable = '󰘛 ',
        },
    },
}
