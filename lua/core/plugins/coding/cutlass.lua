return {
    'gbprod/cutlass.nvim',
    keys = { 'm', 'M', { 'm', mode = 'v' } },
    opts = {
        cut_key = 'm', -- the key that acts as move/cut
        override_del = 'false', -- "<DEL> key also to blackole register"
        registers = {
            select = '_', -- put into register "s" or whatever
            delete = '_', -- put into register "d" or whatever
            change = '_', -- put into register "c" or whatever
        },
    },
}
