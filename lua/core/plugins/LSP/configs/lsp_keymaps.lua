local keymap = vim.keymap  -- for conciseness
local native = vim.lsp.buf -- for conciseness

return {
    registerKeymaps = function(bufnr)
        local opts = { desc = ' Signature help', buffer = bufnr }
        if require('core.enable_plugins').lsp_signature then
            vim.keymap.set('n', '<leader>ls', function()
                require('lsp_signature').toggle_float_win()
            end, opts)
        else
            keymap.set('n', '<leader>ls', native.signature_help, opts) -- show documentation for what is under cursor
        end

        -- ------------------------------------------------------------------------------------------------------------
        SagaEnabled = require('core.enable_plugins').lspsaga
        -- GO TO DEFINITION
        keymap.set('n', 'gd', native.definition, { desc = 'λ GO TO Definition', buffer = bufnr }) -- go to definition

        -- PPEK DEFINITION
        keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', { desc = 'Peek Definition', buffer = bufnr }) -- peek definition and make edits in window

        -- GO TO DECLARATION
        keymap.set('n', 'gD', native.declaration, { desc = 'α GO TO Declaration', buffer = bufnr }) -- got to declaration

        -- GO TO REFERENCES
        -- keymap.set('n', 'gr', native.references, { desc = 'Λ GO TO References', buffer = bufnr }) -- go to definition
        keymap.set('n', 'gr', native.references, { desc = 'Λ GO TO References', buffer = bufnr }) -- go to definition

        -- GO TO IMPLEMENTATION
        keymap.set('n', 'gI', native.implementation, { desc = 'β GO TO Implementation', buffer = bufnr }) -- go to implementation

        -- GO TO IMPLEMENTATION
        keymap.set('n', 'gt', native.type_definition, { desc = '𝖉 GO TO Type', buffer = bufnr }) -- go to type definition

        -- ------------------------------------------------------------------------------------------------------------
        keymap.set('n', '<leader>lf', 'native.format{async=true}', { desc = 'ﯔ Auto-Format', buffer = bufnr }) -- see available code actions
        -- ------------------------------------------------------------------------------------------------------------

        keymap.set("n", "yc", "yygccp", { remap = true, desc = "[P]aste to a comment above" })
        keymap.set("v", "<C-p>", "ygvgc`>p", { remap = true, desc = "[P]aste to a comment above" })

        -- NAVIGATION
        if require('core.enable_plugins').navbuddy then
            keymap.set('n', '<leader>ll', '<cmd>Navbuddy<CR>', { desc = ' Symbol Browser', buffer = bufnr }) -- show  diagnostics for line
        end
        -- FIXME:if we enable only on LSP, outline window doesn't see <leader>e itself
        -- Maybe add autocomand
        if require('core.enable_plugins').symbols_outline then
            keymap.set(
                'n',
                '<leader>le',
                '<cmd>SymbolsOutline<CR>',
                { desc = 'ﯻ Toggle Symbol Explorer', buffer = bufnr }
            ) -- see outline on right hand side
        end

        -- LSP SEARCH SYMBOLS
        keymap.set(
            'n',
            '<leader>ld',
            '<cmd>Telescope lsp_document_symbols<CR>',
            { desc = ' Document Symbols', buffer = bufnr }
        )
        keymap.set(
            'n',
            '<leader>lw',
            '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',
            { desc = '冷Workspace Symbols', buffer = bufnr }
        )
        -- stopped working
        -- keymap.set('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<CR>', { desc = 'LSP finder' }) -- show definition, references

        -- Call hierarchy
        -- Not very useful, never finds anything
        -- keymap.set(
        --     'n',
        --     '<Leader>li',
        --     '<cmd>Lspsaga incoming_calls<CR>',
        --     { desc = '↳ Incoming Calls', buffer = bufnr }
        -- )
        -- keymap.set(
        --     'n',
        --     '<Leader>lo',
        --     '<cmd>Lspsaga outgoing_calls<CR>',
        --     { desc = '↱ Outgoing Calls', buffer = bufnr }
        -- )

        -- ------------------------------------------------------------------------------------------------------------
        -- HOVER
        -- LSPAGA NOT SO NICE LOOKING ONCE WE HAVE
        -- keymap.set('n', '<leader>lH', '<cmd>Lspsaga hover_doc<CR>', { desc = 'saga Hover Documentation' }) -- show documentation for what is under cursor
        keymap.set(
            'n',
            '<leader>lh',
            "<cmd>lua require('pretty_hover').hover()<CR>",
            { desc = ' Hover Documentation', buffer = bufnr }
        )

        -- ------------------------------------------------------------------------------------------------------------
        -- RENAME
        if require('core.enable_plugins').lspsaga then
            keymap.set(
                'n',
                '<leader>lr',
                '<cmd>Lspsaga rename<CR>',
                { desc = '牢Rename Symbol under cursor', buffer = bufnr }
            ) -- smart rename
        else
            keymap.set(
                'n',
                '<leader>lr',
                vim.lsp.buf.rename,
                { desc = '牢Rename Symbol under cursor', buffer = bufnr }
            ) -- smart rename
        end

        -- ------------------------------------------------------------------------------------------------------------
        -- DIAGNOSTICS STUFF
        local wk_enabled = require('core.enable_plugins').whichkey
        if wk_enabled then
            local wkl = require('which-key')
            wkl.register({
                name = '   Diagnostics',
            }, { prefix = '<leader>i', buffer = 0 })
        end

        -- DIAGNOSTICS JUMPING
        -- keymap.set('n', '<leader>ip', vim.diagnostic.goto_prev, { desc = '⬅ Previous Diagnostics', buffer = bufnr })
        -- keymap.set('n', '<leader>in', vim.diagnostic.goto_next, { desc = '➡ Next Diagnostics', buffer = bufnr })
        -- keymap.set('n', '<C-p>', vim.diagnostic.goto_prev, { desc = '⬅ Previous Diagnostics', buffer = bufnr })
        -- keymap.set('n', '<C-n>', vim.diagnostic.goto_next, { desc = '➡ Next Diagnostics', buffer = bufnr })
        -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostics" }) -- jump to previous diagnostic in buffer
        -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostics" }) -- jump to next diagnostic in buffer

        -- Diagnostics search
        keymap.set(
            'n',
            '<leader>id',
            '<cmd>Telescope diagnostics bufnr=0<CR>',
            { desc = '  Document Diagnostics', buffer = bufnr }
        )
        keymap.set(
            'n',
            '<leader>iD',
            '<cmd>Telescope diagnostics<CR>',
            { desc = '❌ Workspace Diagnostics', buffer = bufnr }
        )

        -- CURSOR DIAGNOSTICS
        if require('core.enable_plugins').lspsaga then
            keymap.set(
                'n',
                '<leader>ii',
                '<cmd>Lspsaga show_cursor_diagnostics<CR>',
                { desc = '  Diagnostics under cursor', buffer = bufnr }
            )
            keymap.set(
                'n',
                '<leader>il',
                '<cmd>Lspsaga show_line_diagnostics<CR>',
                { desc = '林 Diagnostics under line', buffer = bufnr }
            )
        else
            keymap.set(
                'n',
                '<leader>ii',
                vim.diagnostic.open_float,
                { desc = ' Diagnostic under cursor', buffer = bufnr }
            )
        end

        -- -- Quickfix List
        -- -- TODO: DOES THIS EVEN WORK?
        -- keymap.set(
        --     'n',
        --     '<leader>iq',
        --     'vim.diagnostic.setloclist',
        --     { desc = ' Send Diagnostics to LocList', buffer = bufnr }
        -- )

        -- ------------------------------------------------------------------------------------------------------------
        -- CODE ACTIONS

        -- TODO: telescope seems like a better solution :
        -- https://github.com/aznhe21/actions-preview.nvim
        -- vim.keymap.set({ "v", "n" }, '<leader>la', require("actions-preview").code_actions)
        local CodeActionsDescription = ' Code Actions'
        local CodeActionMenuEnabled = require('core.enable_plugins').code_action_menu
        local LspSagaEnabled = require('core.enable_plugins').lspsaga
        if CodeActionMenuEnabled then
            keymap.set(
                'n',
                '<leader>la',
                ':CodeActionMenu<CR><C-w><C-p>', -- TODO: why doesn't it autofocus?
                { desc = CodeActionsDescription .. ' (CodeActionMenu)', buffer = bufnr }
            )                                    -- see available code actions
        elseif LspSagaEnabled then
            keymap.set(
                'n',
                '<leader>la',
                '<cmd>Lspsaga code_action<CR>',
                { desc = CodeActionsDescription .. ' (LspSaga)', buffer = bufnr }
            ) -- see available code actions
        else
            keymap.set(
                'n',
                '<leader>la',
                vim.lsp.codelens.run,
                { desc = CodeActionsDescription .. ' ( default CodeLens)', buffer = bufnr }
            ) -- see available code actions
        end
    end,
}
