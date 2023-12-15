--- Provides snippets for Markdown.

local parse = require('luasnip.util.parser').parse_snippet
return {
    parse('code', '```${1}\n$0\n```'),
    parse('cppcode', '```cpp\n$0\n```'),
    parse('pythoncode', '```python\n$0\n```'),
    parse('error', '<error>\n$0\n</error>'),
    parse('warning', '<warning>\n$0\n</warning>'),
    parse('note', '<note>\n$0\n</note>'),
    parse('success', '<success>\n$0\n</success>'),
    parse('info', '<info>\n$0\n</info>'),
    parse('mark', '<mark>$0</mark>'),
    parse('h', '# $0'),
    parse('hh', '## $0'),
    parse('h3', '### $0'),
    parse('h4', '#### $0'),
    parse('h5', '##### $0'),
    parse('h6', '###### $0'),
    parse('bold', '***$1*** $0'),
    parse('ita', '*$1* $0'),
}
