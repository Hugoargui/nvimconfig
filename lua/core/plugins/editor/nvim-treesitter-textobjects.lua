return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    enabled = require('core.enable_plugins').treesitter_textobjects,
    -- TODO: [] movements don't work if you just entered vim and didnt' change mode

    event = { 'ModeChanged' }, -- there is no OperatorPendingModeEnter, this is the second best

    config = function()
        require('nvim-treesitter.configs').setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {

                        -- TODO: would be nice if this worked!
                        -- ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
                        -- ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
                        -- ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
                        -- ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

                        ['am'] = { query = '@call.outer', desc = 'Method Call' },
                        ['im'] = { query = '@call.inner', desc = 'Method Call' },
                        ['af'] = { query = '@function.outer', desc = 'Function' },
                        ['if'] = { query = '@function.inner', desc = 'Function' },
                        ['ac'] = { query = '@class.outer', desc = 'Class' },
                        ['ic'] = { query = '@class.inner', desc = 'Class' },
                        ['ix'] = { query = '@conditional.inner', desc = 'Conditional' },
                        ['ax'] = { query = '@conditional.outer', desc = 'Conditional' },
                        ['io'] = { query = '@loop.inner', desc = 'Loop' },
                        ['ao'] = { query = '@loop.outer', desc = 'Loop' },
                        ['ak'] = { query = '@comment.outer', desc = 'Comment' }, -- outer seems to not work
                        ['ik'] = { query = '@comment.outer', desc = 'Comment' },
                        ['id'] = { query = '@number.inner', desc = 'Number' },
                        ['ad'] = { query = '@number.inner', desc = 'Number' },
                        ['ia'] = { query = '@parameter.inner', desc = 'Argument' },
                        ['aa'] = { query = '@parameter.outer', desc = 'Argument' },

                        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                        [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
                        [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
                    },
                },

                -- Overwrite default [[ (class) and M(function) mappings
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']m'] = { query = '@call.outer', desc = ' Next Method Call start' },
                        [']f'] = { query = '@function.outer', desc = ' Next Function Definition start' },
                        [']c'] = { query = '@class.outer', desc = ' Next Class start' },
                        [']x'] = { query = '@conditional.outer', desc = '謁 Next Conditional' },
                        [']o'] = { query = '@loop.outer', desc = ' Next Loop' },
                        [']k'] = { query = '@comment.outer', desc = ' Next Comment' },
                        [']d'] = { query = '@number.inner', desc = ' Next Number' },
                        [']a'] = { query = '@parameter.inner', desc = ' Next Parameter' },
                    },
                    goto_next_end = {
                        [']M'] = { query = '@call.outer', desc = ' Next Method Call end' },
                        [']F'] = { query = '@function.outer', desc = ' Next Function Definition end' },
                        [']C'] = { query = '@class.outer', desc = ' Next Class end' },
                        [']X'] = { query = '@conditional.outer', desc = '謁 Next conditional end' },
                        [']O'] = { query = '@loop.outer', desc = ' Next loop end' },
                    },
                    goto_previous_start = {
                        ['[m'] = { query = '@call.outer', desc = ' Prev Method Call start' },
                        ['[f'] = { query = '@function.outer', desc = ' Prev Function Definition start' },
                        ['[c'] = { query = '@class.outer', desc = ' Prev Class start' },
                        ['[x'] = { query = '@conditional.outer', desc = '謁 Next Conditional' },
                        ['[o'] = { query = '@loop.outer', desc = ' Next Loop' },
                        ['[k'] = { query = '@comment.outer', desc = ' Prev Comment' },
                        ['[d'] = { query = '@number.inner', desc = ' Prev Number' },
                        ['[a'] = { query = '@parameter.inner', desc = ' Prev Parameter' },
                    },
                    goto_previous_end = {
                        ['[M'] = { query = '@call.outer', desc = ' Prev Method Call end' },
                        ['[F'] = { query = '@function.outer', desc = ' Prev Function Definition end' },
                        ['[C'] = { query = '@class.outer', desc = ' Prev Class end' },
                        ['[X'] = { query = '@conditional.outer', desc = '謁 Prev conditional end' },
                        ['[O'] = { query = '@loop.outer', desc = ' Prev loop end' },
                    },
                }, -- textobjects::move
                -- TODO : add whichkey description to this
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>lna'] = { query = '@parameter.inner', desc = 'swap this argument/param with next' },
                        ['<leader>lnf'] = { query = '@function.outer', desc = 'swap this function with next' },
                    },
                    swap_previous = {
                        ['<leader>lpa'] = { query = '@parameter.inner', desc = 'swap this argument/param with prev' },
                        ['<leader>lpf'] = { query = '@function.outer', desc = 'swap function with prev' },
                    },
                },
            }, -- textobjects
        })
    end,
}
