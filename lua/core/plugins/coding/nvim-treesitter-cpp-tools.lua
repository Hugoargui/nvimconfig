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
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>+f',
            '<cmd>TSCppDefineClassFunc<cr>',
            { desc = '💻 Implement Class Functions' }
        )
        vim.keymap.set({ 'n', 'v' }, '<leader>+v', '<cmd>TSCppMakeConcreteClass<cr>', { desc = ' Concrete Class' })
        vim.keymap.set({ 'n', 'v' }, '<leader>+3', '<cmd>TSCppRuleOf3<cr>', { desc = ' Rule of 3' })
        vim.keymap.set({ 'n', 'v' }, '<leader>+5', '<cmd>TSCppRuleOf5<cr>', { desc = ' Rule of 5' })
    end,
}
