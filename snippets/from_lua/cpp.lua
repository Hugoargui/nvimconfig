--- Provides snippets for C++.

local ts_utils = require('nvim-treesitter.ts_utils')

local ls = require('luasnip')
local snippet = ls.snippet
local snippet_node = ls.snippet_node
-- local isn = ls.indent_snippet_node
local text_node = ls.text_node
local insert_node = ls.insert_node
local function_node = ls.function_node
local choice_node = ls.choice_node
local dynamic_node = ls.dynamic_node
local restore_node = ls.restore_node
-- local events = require('luasnip.util.events')
-- local ai = require('luasnip.nodes.absolute_indexer')
local extras = require('luasnip.extras')
local lambda = extras.lambda
local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
local nonempty = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require('luasnip.extras.fmt').fmt
-- local fmta = require('luasnip.extras.fmt').fmta
-- local conds = require('luasnip.extras.expand_conditions')
-- local postfix = require('luasnip.extras.postfix').postfix
-- local types = require('luasnip.util.types')
local parse = require('luasnip.util.parser').parse_snippet
-- local ms = ls.multi_snippet
-- local k = require('luasnip.nodes.key_indexer').new_key

local cpp_classes = vim.treesitter.query.parse(
    'cpp',
    [[
    [
        (struct_specifier name: [((type_identifier) @name) (template_type name: (type_identifier) @name)])
        (class_specifier name: [((type_identifier) @name) (template_type name: (type_identifier) @name)])
    ] @class
]]
)

--- Returns list of all C++ classes or structs in the language tree that contains a given line.
-- @param linenr Line number that will be used to get the language tree.
-- @return List of tuples (line begin, line end, class name). Lines use inclusive 1-indexing.
local function list_classes(linenr)
    local bufnr = vim.api.nvim_get_current_buf()

    local root = ts_utils.get_root_for_position(linenr - 1, 0)
    if not root then
        return {}
    end

    local result = {}

    for _, captures, _ in cpp_classes:iter_matches(root, bufnr) do
        local lbegin, _, lend, _ = ts_utils.get_vim_range({ captures[2]:range() })
        local name = vim.treesitter.get_node_text(captures[1], bufnr)
        table.insert(result, { lbegin, lend, name })
    end

    return result
end

--- Gets name of the surrounding C++ class.
-- @param linenr Line number to use.
-- @return Name of the surrounding class or nil if none was found.
local function get_surrounding_class(linenr)
    local classes = list_classes(linenr)
    local min_range
    local min_name

    for _, class_info in pairs(classes) do
        local lbegin, lend, name = unpack(class_info)

        if lbegin <= linenr and lend >= linenr and (not min_range or lend - lbegin < min_range) then
            min_range = lend - lbegin
            min_name = name
        end
    end

    return min_name
end

return {
    -- s('for', {
    --     t('for ('),
    --     c(1, {
    --         sn(nil, { t('const auto& '), r(1, 'elem'), t(' : '), r(2, 'range') }),
    --         sn(nil, { t('auto& '), r(1, 'elem'), t(' : '), r(2, 'range') }),
    --         sn(nil, {
    --             t('std::size_t '),
    --             i(1, 'i'),
    --             t(' = '),
    --             i(2, '0'),
    --             t('; '),
    --             rep(1),
    --             t(' < '),
    --             i(3, 'n'),
    --             t('; ++'),
    --             rep(1),
    --         }),
    --     }),
    --     t({ ') {', '\t' }),
    --     i(0),
    --     t({ '', '}' }),
    -- }, { stored = { elem = i(1, 'elem'), range = i(2, 'range') } }),
    -- parse('while', 'while (${1:cond}) {\n\t$0\n}'),
    -- parse('do', 'do {\n\t$0\n} while (${1:cond});'),
    -- s('if', {
    --     t('if ('),
    --     c(1, {
    --         r(1, 'cond'),
    --         sn(nil, { i(1, 'init'), t('; '), r(2, 'cond') }),
    --     }),
    --     t({ ') {', '\t' }),
    --     i(0),
    --     t({ '', '}' }),
    -- }, { stored = { cond = i(1, 'cond') } }),
    snippet('ifc', {
        text_node('if constexpr ('),
        choice_node(1, {
            restore_node(1, 'cond'),
            snippet_node(nil, { insert_node(1, 'init'), text_node('; '), restore_node(2, 'cond') }),
        }),
        text_node({ ') {', '\t' }),
        insert_node(0),
        text_node({ '', '}' }),
    }, { stored = { cond = insert_node(1, 'cond') } }),
    parse('e', 'else {\n\t$0\n}'),
    parse('ei', 'else if ($1) {\n\t$0\n}'),
    parse('eic', 'else if constexpr ($1) {\n\t$0\n}'),

    -- Standard library types / containers
    parse('vec', 'std::vector<${1:T}>'),
    parse('map', 'std::unordered_map<${1:Key}, ${2:Value}>'),
    parse('imap', 'std::map<${1:Key}, ${2:Value}>'),
    parse('str', 'std::string'),
    parse('up', 'std:unique_ptr<${1:T}>'),
    parse('sp', 'std:shared_ptr<${1:T}>'),

    -- Attributes
    parse('nd', '[[nodiscard]]'),

    -- TODO: move all snippets to this style to get proper description and docstring
    snippet(
        { trig = 'example', name = 'add name', dscr = 'add dscr', docstring = 'foo' },
        function_node(function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if not cname then
                print('Could not get surrounding class!')
                return ''
            else
                return cname .. '(' .. cname .. ' const& other);'
            end
        end)
    ),

    -- Special member declarations
    snippet(
        { trig = 'consd', name = 'Constructor Declaration', dscr = '', docstring = 'ClassName($1);' },
        dynamic_node(1, function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if not cname then
                print('Could not get surrounding class!')
                return snippet_node(nil, { text_node('') })
            else
                return snippet_node(nil, { text_node(cname), text_node('('), insert_node(1), text_node(');') })
            end
        end)
    ),

    snippet(
        {
            trig = 'cconsd',
            name = 'Copy Constructor Declaration',
            dscr = '',
            docstring = 'ClassName(ClassName const& other);',
        },
        function_node(function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if not cname then
                print('Could not get surrounding class!')
                return ''
            else
                return cname .. '(' .. cname .. ' const& other);'
            end
        end)
    ),

    snippet(
        {
            trig = 'mconsd',
            name = 'Move Constructor Declaration',
            dscr = '',
            docstring = 'ClassName(ClassName && other);',
        },
        function_node(function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if not cname then
                print('Could not get surrounding class!')
                return ''
            else
                return cname .. '(' .. cname .. '&& other) noexcept;'
            end
        end)
    ),

    snippet(
        {
            trig = 'cassd',
            name = 'Copy Assignment Operator Declaration',
            dscr = '',
            docstring = 'ClassName& operator=(ClassName const& other);',
        },
        function_node(function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if not cname then
                print('Could not get surrounding class!')
                return ''
            else
                return cname .. '& operator=(' .. cname .. ' const& other);'
            end
        end)
    ),

    snippet(
        {
            trig = 'massd',
            name = 'Move Assignment Operator Declaration',
            dscr = '',
            docstring = 'ClassName& operator=(ClassName && other);',
        },
        function_node(function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if not cname then
                print('Could not get surrounding class!')
                return ''
            else
                return cname .. '& operator=(' .. cname .. '&& other) noexcept;'
            end
        end)
    ),

    snippet(
        {
            trig = 'desd',
            name = 'Destructor Declaration',
            dscr = '',
            docstring = '~ClasName();',
        },
        function_node(function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if not cname then
                print('Could not get surrounding class!')
                return ''
            else
                return '~' .. cname .. '();'
            end
        end)
    ),

    -- Special member definitions
    snippet(
        { trig = 'consi', name = 'Constructor Implementation', dscr = '', docstring = '' },
        dynamic_node(1, function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if cname then
                return snippet_node(nil, {
                    text_node(cname .. '('),
                    insert_node(1),
                    text_node(')'),
                    nonempty(2, ' : '),
                    insert_node(2),
                    text_node({ ' {', '\t' }),
                    insert_node(3),
                    text_node({ '', '}' }),
                })
            else
                return snippet_node(nil, {
                    insert_node(1, 'Class'),
                    text_node('::'),
                    rep(1),
                    text_node('('),
                    insert_node(2),
                    text_node(')'),
                    nonempty(3, ' : '),
                    insert_node(3),
                    text_node({ ' {', '\t' }),
                    insert_node(4),
                    text_node({ '', '}' }),
                })
            end
        end)
    ),

    -- snippet('cconsi', {
    --     dscr = 'Copy Constructor Implementation',
    --     dynamic_node(1, function(_, snip)
    --         local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
    --         if cname then
    --             return snippet_node(nil, {
    --                 text_node({ cname .. '(' .. cname .. ' const& other) {', '\t' }),
    --                 insert_node(1),
    --                 text_node({ '', '}' }),
    --             })
    --         else
    --             return snippet_node(nil, {
    --                 insert_node(1, 'Class'),
    --                 text_node('::'),
    --                 lambda(lambda._1:match('([^<]*)'), 1),
    --                 text_node('('),
    --                 lambda(lambda._1:match('([^<]*)'), 1),
    --                 text_node({ ' const& other) {', '\t' }),
    --                 insert_node(2),
    --                 text_node({ '', '}' }),
    --             })
    --         end
    --     end),
    -- }),

    snippet(
        { trig = 'cconsi', name = 'Copy Constructor Implementation', dscr = '', docstring = '' },
        dynamic_node(1, function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if cname then
                return snippet_node(nil, {
                    text_node({ cname .. '(' .. cname .. ' const& other) {', '\t' }),
                    insert_node(1),
                    text_node({ '', '}' }),
                })
            else
                return snippet_node(nil, {
                    insert_node(1, 'Class'),
                    text_node('::'),
                    lambda(lambda._1:match('([^<]*)'), 1),
                    text_node('('),
                    lambda(lambda._1:match('([^<]*)'), 1),
                    text_node({ ' const& other) {', '\t' }),
                    insert_node(2),
                    text_node({ '', '}' }),
                })
            end
        end)
    ),

    -- snippet('mconsi', {
    --     dscr = 'Move Constructor Implementation',
    --     dynamic_node(1, function(_, snip)
    --         local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
    --         if cname then
    --             return snippet_node(nil, {
    --                 text_node({ cname .. '(' .. cname .. '&& other) noexcept {', '\t' }),
    --                 insert_node(1),
    --                 text_node({ '', '}' }),
    --             })
    --         else
    --             return snippet_node(nil, {
    --                 insert_node(1, 'Class'),
    --                 text_node('::'),
    --                 lambda(lambda._1:match('([^<]*)'), 1),
    --                 text_node('('),
    --                 lambda(lambda._1:match('([^<]*)'), 1),
    --                 text_node({ '&& other) noexcept {', '\t' }),
    --                 insert_node(2),
    --                 text_node({ '', '}' }),
    --             })
    --         end
    --     end),
    -- }),

    snippet(
        { trig = 'mconsi', name = 'Move Constructor Implementation', dscr = '', docstring = '' },
        dynamic_node(1, function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if cname then
                return snippet_node(nil, {
                    text_node({ cname .. '(' .. cname .. '&& other) noexcept {', '\t' }),
                    insert_node(1),
                    text_node({ '', '}' }),
                })
            else
                return snippet_node(nil, {
                    insert_node(1, 'Class'),
                    text_node('::'),
                    lambda(lambda._1:match('([^<]*)'), 1),
                    text_node('('),
                    lambda(lambda._1:match('([^<]*)'), 1),
                    text_node({ '&& other) noexcept {', '\t' }),
                    insert_node(2),
                    text_node({ '', '}' }),
                })
            end
        end)
    ),

    -- snippet('cassi', {
    --     dscr = 'Copy Assignment Implementation',
    --     dynamic_node(1, function(_, snip)
    --         local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
    --         if cname then
    --             return snippet_node(nil, {
    --                 text_node({ cname .. '& operator=(' .. cname .. ' const& other) {', '\t' }),
    --                 insert_node(1),
    --                 text_node({ '', '\treturn *this;', '}' }),
    --             })
    --         else
    --             return snippet_node(nil, {
    --                 insert_node(1, 'Class'),
    --                 text_node('& '),
    --                 rep(1),
    --                 text_node('::operator=('),
    --                 lambda(lambda._1:match('([^<*])'), 1),
    --                 text_node({ ' const& other) {', '\t' }),
    --                 insert_node(2),
    --                 text_node({ '', '\treturn *this;', '}' }),
    --             })
    --         end
    --     end),
    -- }),

    snippet(
        { trig = 'cassi', name = 'Copy Assignment Implementation', dscr = '', docstring = '' },
        dynamic_node(1, function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if cname then
                return snippet_node(nil, {
                    text_node({ cname .. '& operator=(' .. cname .. ' const& other) {', '\t' }),
                    insert_node(1),
                    text_node({ '', '\treturn *this;', '}' }),
                })
            else
                return snippet_node(nil, {
                    insert_node(1, 'Class'),
                    text_node('& '),
                    rep(1),
                    text_node('::operator=('),
                    lambda(lambda._1:match('([^<*])'), 1),
                    text_node({ ' const& other) {', '\t' }),
                    insert_node(2),
                    text_node({ '', '\treturn *this;', '}' }),
                })
            end
        end)
    ),

    -- snippet('massi', {
    --     dscr = 'Move Assignment Implementation',
    --     dynamic_node(1, function(_, snip)
    --         local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
    --         if cname then
    --             return snippet_node(nil, {
    --                 text_node({ cname .. '& operator=(' .. cname .. '&& other) noexcept {', '\t' }),
    --                 insert_node(1),
    --                 text_node({ '', '\treturn *this;', '}' }),
    --             })
    --         else
    --             return snippet_node(nil, {
    --                 insert_node(1, 'Class'),
    --                 text_node('& '),
    --                 rep(1),
    --                 text_node('::operator=('),
    --                 lambda(lambda._1:match('([^<]*)'), 1),
    --                 text_node({ '&& other) noexcept {', '\t' }),
    --                 insert_node(2),
    --                 text_node({ '', '\treturn *this;', '}' }),
    --             })
    --         end
    --     end),
    -- }),

    snippet(
        { trig = 'massi', name = 'Move Assignment Implementation', dscr = '', docstring = '' },
        dynamic_node(1, function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if cname then
                return snippet_node(nil, {
                    text_node({ cname .. '& operator=(' .. cname .. '&& other) noexcept {', '\t' }),
                    insert_node(1),
                    text_node({ '', '\treturn *this;', '}' }),
                })
            else
                return snippet_node(nil, {
                    insert_node(1, 'Class'),
                    text_node('& '),
                    rep(1),
                    text_node('::operator=('),
                    lambda(lambda._1:match('([^<]*)'), 1),
                    text_node({ '&& other) noexcept {', '\t' }),
                    insert_node(2),
                    text_node({ '', '\treturn *this;', '}' }),
                })
            end
        end)
    ),

    -- snippet('desi', {
    --     dscr = 'Destructor Implementation',
    --     dynamic_node(1, function(_, snip)
    --         local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
    --         if cname then
    --             return snippet_node(
    --                 nil,
    --                 { text_node({ '~' .. cname .. '() {', '\t' }), insert_node(1), text_node({ '', '}' }) }
    --             )
    --         else
    --             return snippet_node(nil, {
    --                 insert_node(1, 'Class'),
    --                 text_node('::~'),
    --                 lambda(lambda._1:match('([^<]*)'), 1),
    --                 text_node({ '() {', '\t' }),
    --                 insert_node(2),
    --                 text_node({ '', '}' }),
    --             })
    --         end
    --     end),
    -- }),

    snippet(
        { trig = 'desi', name = 'Destructor Implementation', dscr = '', docstring = '' },
        dynamic_node(1, function(_, snip)
            local cname = get_surrounding_class(tonumber(snip.env.TM_LINE_NUMBER))
            if cname then
                return snippet_node(
                    nil,
                    { text_node({ '~' .. cname .. '() {', '\t' }), insert_node(1), text_node({ '', '}' }) }
                )
            else
                return snippet_node(nil, {
                    insert_node(1, 'Class'),
                    text_node('::~'),
                    lambda(lambda._1:match('([^<]*)'), 1),
                    text_node({ '() {', '\t' }),
                    insert_node(2),
                    text_node({ '', '}' }),
                })
            end
        end)
    ),

    -- Other
    parse('ip', '${1:range}.begin(), $1.end()'),

    parse('print', "std::cout << $1 << '\\n';"),

    snippet('bind', {
        choice_node(1, {
            snippet_node(nil, {
                text_node('auto const& ['),
                restore_node(1, 'bindings'),
                text_node('] = '),
                restore_node(2, 'value'),
                text_node(';'),
            }),
            snippet_node(nil, {
                text_node('auto&& ['),
                restore_node(1, 'bindings'),
                text_node('] = '),
                restore_node(2, 'value'),
                text_node(';'),
            }),
        }),
    }, { stored = { bindings = insert_node(1, 'bindings'), value = insert_node(2, 'value') } }),

    -- snippet('main', {
    --     text_node('int main('),
    --     choice_node(1, {
    --         text_node(''),
    --         text_node('int const argc, char const* const* const argv'),
    --     }),
    --     text_node({ ') {', '\t' }),
    --     insert_node(0),
    --     text_node({ '', '}' }),
    -- }),

    snippet('inc', {
        text_node('#include '),
        choice_node(1, {
            snippet_node(nil, { text_node('<'), restore_node(1, 'header'), text_node('>') }),
            snippet_node(nil, { text_node('"'), restore_node(1, 'header'), text_node('"') }),
        }),
    }, { stored = { header = insert_node(1, 'header') } }),

    parse('cinit', 'auto const $1 = [&] {\n\t$0\n}();'),
}
