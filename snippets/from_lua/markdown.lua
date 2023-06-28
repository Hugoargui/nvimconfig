--- Provides snippets for Markdown.

return {
    parse('code', '```${1}\n$0\n```'),
    parse('cppcode', '```C++\n$0\n```'),
}
