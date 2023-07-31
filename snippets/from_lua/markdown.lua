--- Provides snippets for Markdown.

local parse = require('luasnip.util.parser').parse_snippet
return {
    parse('code', '```${1}\n$0\n```'),
    parse('cppcode', '```c++\n$0\n```'),
    parse('error', '<error>\n$0\n</error>'),
    parse('warning', '<warning>\n$0\n</warning>'),
    parse('note', '<note>\n$0\n</note>'),
    parse('success', '<success>\n$0\n</success>'),
    parse('info', '<info>\n$0\n</info>'),
    parse('mark', '<mark>$0</mark>'),
}
