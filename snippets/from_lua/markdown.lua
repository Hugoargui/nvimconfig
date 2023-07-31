--- Provides snippets for Markdown.

local parse = require('luasnip.util.parser').parse_snippet
return {
    parse('code', '```${1}\n$0\n```'),
    parse('cppcode', '```c++\n$0\n```'),
}
