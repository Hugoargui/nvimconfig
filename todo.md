# NEAR FUTURE
- sypder for big words works finally, thangs to reddit thread, but figure out how to do it for operation pending mode
    https://old.reddit.com/r/neovim/comments/181bsu8/my_take_on_a_word_movement/
- improve build/compile/run life-cycle.
- improve search and replace workflow, by example by using Spectre/grugfar

# MEDIUM TERM IDEAS
- python REPL
- tabout plugin
- try tabtree navigation mapped to { and } https://github.com/roobert/tabtree.nvim
- figure out how to make spellchecker ignore url links (and maybe stuff between quotes).
    syn match texSomevariable "mooncipal" containedin=@spell.markdown contains=@NoSpell
    syn match dontSpellCheck "mooncipal" contains=@NoSpell
- incremental selection
- [fixed?] find way to dim unused variables, neodim breaks highlights
- git
        - integrating Git in nvim youtube video: https://www.youtube.com/watch?v=57x4ZzzCr2Y&pp=ygUdaW50ZWdyYXRpbiBnaXQgdmltIGFuZCBuZW92aW0%3D
        - Git mergetool tutorial with git: https://gist.github.com/karenyyng/f19ff75c60f18b4b8149
        - compare to mergetool, other plugins
    - lazygit is nice but not so vim like, replace by git ui that allows to move around with vim window motions
- Highlight undo plugin (I tried but didn't manage to make it highlight, not worth the time for now)

- Modes.nvim to highlight deleted lines and changed lines.
- reactive maybe much better than modes, more features: https://github.com/rasulomaroff/reactive.nvim

- sibling-swap.nvim
- Arpeggio -> asdf for page scrolling, see arpeggio issues about remap warning
- Arpeggio for number motions (w+k = 5w for example)
- to jump faster in telescope: https://github.com/nvim-telescope/telescope-hop.nvim
- improve jumplist a lot: mapping for jump only in this file or jump only in external file: https://github.com/kwkarlwang/bufjump.nvim
- emacs parenthesis navigation https://www.emacswiki.org/emacs/NavigatingParentheses

# LONG TIME IDEAS, NOT URGENT
- remove cursor when navigating nerdtre
- FLASH jump plugin
- still not totally happy with yank interface
- try the moonicipal task runner or another task runner

# LONGER TERM GOALS
- https://github.com/homerours/jumper.nvim (also jumper for command line)
- 'jceb/blinds.nvim', and vim.g.blinds_guibg = '#450341' gives nice results. Consider this alternative

# CHANGES IN WORKFLOW
this are pretty big changes that I'd like to explore someday, but are not critical right now
- try structural search and replace
- try yode-nvim
- try multicursors
- move parens around using treesitter, even with multicursors: clasp https://github.com/xzbdmw/clasp.nvim

- AI (copilot or similar)
- more quckfix usage
    - https://github.com/stevearc/quicker.nvim

# interesting plugins to think about
- https://github.com/tris203/precognition.nvim highlights wbWB% motions in virtual line
- https://github.com/andrewferrier/debugprint.nvim
- https://github.com/aaronik/treewalker.nvim
- https://github.com/chrisgrieser/nvim-recorder better macro shortcuts
