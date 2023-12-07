# NEAR FUTURE 
- Arpeggio -> jf=escape... asdf for page scrolling, hjkl for window
- Arpeggio for number motions (w+k = 5w for example)
- check this take on word movement vs spider/smartword:
    https://old.reddit.com/r/neovim/comments/181bsu8/my_take_on_a_word_movement/
- improve build/compile/run life-cycle. 
- LUA files very slow
    - With all plugins anabled, everything lags, almost unusable
    - Disabling tresitter big improvement
    - Disabling most plugins noticable improvement
    - Lua LSP has problemsn attaching
    - nulls at some point was giving timeout warnings
    - Could be related to nullls/LSP plugins blocking... check it out

# MEDIUM TERM IDEAS
- python REPL
- tabout plugin
- dial
- try tabtree navigation mapped to { and } https://github.com/roobert/tabtree.nvim
- figure out how to make spellchecker ignore url links.
- incremental selection
- incorporate the awesome cpp snippets I found https://github.com/t-troebst/config.nvim/blob/master/snippets/cpp.lua
- incorporate algorithm mnemonics for cpp
- git
        - integrating Git in nvim youtube video: https://www.youtube.com/watch?v=57x4ZzzCr2Y&pp=ygUdaW50ZWdyYXRpbiBnaXQgdmltIGFuZCBuZW92aW0%3D
        - Git mergetool tutorial with git: https://gist.github.com/karenyyng/f19ff75c60f18b4b8149
        - compare to mergetool, other plugins
    - lazygit is nice but not so vim like, replace by git ui that allows to move around with vim window motions

# LONG TIME IDEAS, NOT URGENT
- improve search and replace workflow, by example by using Spectre
- remove cursor when navigating nerdtree
- FLASH jump plugin
- still not totally happy with yank interface
- try the moonicipal task runner or another task runner

# LONGER TERM GOALS
- 'jceb/blinds.nvim', and vim.g.blinds_guibg = '#450341' gives nice results. Consider this alternative

# CHANGES IN WORKFLOW
this are pretty big changes that I'd like to explore someday, but are not critical right now
- try structural search and replace
- try yode-nvim
- try multicursors
- try ideas from this video https://www.youtube.com/watch?v=U420QymHjlA
- AI (copilot or similar)

