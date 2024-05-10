return {
    'stevearc/overseer.nvim',
    keys = {
        {
            '<leader>be',
            '<cmd>OverseerToggle<CR>',
            desc = 'ﯻ Toggle Tasks Panel',
        },
        {
            '<leader>br',
            '<cmd>OverseerRun<CR>',
            desc = ' Run Task',
        },
    },
    config = function()
        local overseer = require('overseer')
        overseer.setup({})
        overseer.add_template_hook({
            module = '^cargo$',
        }, function(task_defn, util)
            util.add_component(task_defn, { 'on_output_quickfix', open = true })
        end)
        overseer.add_template_hook({
            -- module = '^cmake',
            filetype = 'cpp',
        }, function(task_defn, util)
            util.add_component(task_defn, { 'on_output_quickfix', open = true })
        end)
        vim.api.nvim_create_user_command('OverseerRestartLast', function()
            local tasks = overseer.list_tasks({ recent_first = true })
            if vim.tbl_isempty(tasks) then
                vim.notify('No tasks found', vim.log.levels.WARN)
            else
                overseer.run_action(tasks[1], 'restart')
            end
        end, {})
        vim.keymap.set('n', '<leader>bb', '<cmd>OverseerRestartLast<CR>', { desc = ' Re-Run Last Task' })
    end,
}
