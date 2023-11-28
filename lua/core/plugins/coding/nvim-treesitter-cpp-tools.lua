return {
    'Badhi/nvim-treesitter-cpp-tools',
    enabled = require('core.enable_plugins').cpptools,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'cpp', 'c' },
    config = function()
        require('nt-cpp-tools').setup({
            preview = {
                quit = 'q', -- optional keymapping for quit preview
                accept = '<tab>', -- optional keymapping for accept preview
            },
            header_extension = 'h', -- optional
            source_extension = 'cxx', -- optional
            custom_define_class_function_commands = { -- optional
                TSCppImplWrite = {
                    output_handle = require('nt-cpp-tools.output_handlers').get_add_to_cpp(),
                },
                --[[
        <your impl function custom command name> = {
            output_handle = function (str, context) 
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
            },
        })

        local wk_enabled = require('core.enable_plugins').whichkey
        if wk_enabled then
            local wkl = require('which-key')

            vim.cmd('autocmd FileType cpp lua RegisterCpptoolsKeymaps()')
            function RegisterCpptoolsKeymaps()
                wkl.register({
                    name = '   CPP specific options',
                    ['i'] = { '<cmd>TSCppDefineClassFunc<cr>', '💻 Implement Class Functions' },
                    ['c'] = { '<cmd>TSCppMakeConcreteClass<cr>', ' Concrete Class' },
                    ['t'] = { '<cmd>TSCppRuleOf3<cr>', ' Rule of 3' },
                    ['f'] = { '<cmd>TSCppRuleOf5<cr>', ' Rule of 5' },
                }, { prefix = '<leader>a', buffer = 0 })
            end
        else
            -- If not whichkey, this wil lbe available for all filetypes
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>ai',
                '<cmd>TSCppDefineClassFunc<cr>',
                { desc = '💻 Implement Class Functions' }
            )
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>ac',
                '<cmd>TSCppMakeConcreteClass<cr>',
                { desc = ' Concrete Class' }
            )
            vim.keymap.set({ 'n', 'v' }, '<leader>at', '<cmd>TSCppRuleOf3<cr>', { desc = ' Rule of 3' })
            vim.keymap.set({ 'n', 'v' }, '<leader>af', '<cmd>TSCppRuleOf5<cr>', { desc = ' Rule of 5' })
        end
    end,
}
