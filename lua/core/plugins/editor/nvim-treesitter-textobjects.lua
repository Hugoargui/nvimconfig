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
                        ['af'] = { query = '@function.outer', desc = 'Function' },
                        ['if'] = { query = '@function.inner', desc = 'Function' },
                        ['ao'] = { query = '@class.outer', desc = 'Class' },
                        ['io'] = { query = '@class.inner', desc = 'Class' },
                        ['ac'] = { query = '@comment.outer', desc = 'Comment' }, -- outer seems to not work
                        ['ic'] = { query = '@comment.outer', desc = 'Comment' },
                        ['iz'] = { query = '@conditional.inner', desc = 'Conditional' },
                        ['az'] = { query = '@conditional.outer', desc = 'Conditional' },
                        ['ix'] = { query = '@loop.inner', desc = 'Loop' },
                        ['ax'] = { query = '@loop.outer', desc = 'Loop' },
                        ['id'] = { query = '@number.inner', desc = 'Number' },
                        ['ad'] = { query = '@number.inner', desc = 'Number' },
                        ['ia'] = { query = '@parameter.inner', desc = 'Argument' },
                        ['aa'] = { query = '@parameter.outer', desc = 'Argument' },
                    },
                },

                -- Overwrite default [[ (class) and M(function) mappings
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']f'] = { query = '@function.outer', desc = 'Next Function Start ' },
                        [']o'] = { query = '@class.outer', desc = 'Next Class Start' },
                        [']c'] = { query = '@comment.outer', desc = 'Next Comment' },
                        [']z'] = { query = '@conditional.outer', desc = 'Next Conditional' },
                        [']x'] = { query = '@loop.outer', desc = 'Next Loop' },
                        [']d'] = { query = '@number.inner', desc = 'Next Number' },
                        [']a'] = { query = '@Parameter.inner', desc = 'Next Parameter' },
                        [']]'] = '@parameter.inner',
                    },
                    goto_next_end = {
                        [']F'] = { query = '@function.outer', desc = 'Next Function End' },
                        [']O'] = { query = '@class.outer', desc = 'Next Class End' },
                    },
                    goto_previous_start = {
                        ['[['] = '@parameter.inner',
                        ['[f'] = { query = '@function.outer', desc = 'Previous Function Start' },
                        ['[o'] = { query = '@class.outer', desc = 'Previous Class Start' },
                        ['[c'] = { query = '@comment.outer', desc = 'Previous Comment' },
                        ['[z'] = { query = '@conditional.outer', desc = 'Previous Conditional' },
                        ['[x'] = { query = '@loop.outer', desc = 'Previous Loop' },
                        ['[d'] = { query = '@number.inner', desc = 'Previous Number' },
                        ['[a'] = { query = '@parameter.inner', desc = 'Previous Parameter' },
                    },
                    goto_previous_end = {
                        ['[F'] = { query = '@function.outer', desc = 'Previous Function End' },
                        ['[O'] = { query = '@class.outer', desc = 'Previous Class End' },
                    },
                }, -- textobjects::move
            }, -- textobjects
        })
    end,
}
