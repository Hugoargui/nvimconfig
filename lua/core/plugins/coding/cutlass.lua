return {
    'gbprod/cutlass.nvim',
    -- all keys  must be here, not just m/M,  otherwise if I press d before cutlass has been loaded, it will work as without cutlass.
    keys = {
        'd',
        'D',
        'dd',
        'c',
        'C',
        'cc',
        'x',
        'm',
        'mm',
        'M',
        { 'm', mode = 'v' },
        { 'd', mode = 'v' },
        { 'c', mode = 'v' },
    },
    config = function()
        require('cutlass').setup({
            cut_key = 'm', -- the key that acts as move/cut
            override_del = 'false', -- "<DEL> key also to blackole register"
            registers = {
                select = '_', -- put into register "s" or whatever
                delete = '_', -- put into register "d" or whatever
                change = '_', -- put into register "c" or whatever
            },
        })
    end,
}
