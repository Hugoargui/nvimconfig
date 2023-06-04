# NEAR FUTURE 
- better N

# MEDIUM TERM IDEAS
- add window rotation and swaping (now it just moves to bottom/sides, no swaping with existing windows)
- tabout plugin
- incremental selection
- move shortcuts to open files from <leader> mappings to \ mappings (\is file, \\ is folders). Maybe add a permanent todo
- incorporate the awesome cpp snippets I found https://github.com/t-troebst/config.nvim/blob/master/snippets/cpp.lua
- add folds toggle options, folds hints and prettify folds
- automatic hydra popup when opening nerdtree https://www.reddit.com/r/neovim/comments/114jghr/automatic_menu_popup_when_openingfocusing_nvimtree/
- remove cursor when navigating nerdtree
- try themery colorswitcher
- improve search and replace workflow, by example by using Spectre
- optimize command line workflow try fine-cmd-line wilder...
- cokeline fix chose buffer to jump or close
- terminal is more usable now but: escape inside lazygit goes into insert mode instead of closing commit window, fix this.
- terminal: there is a nice plugin called kwkarlwang/bufresize to preserve window size when opening/closing, consider it (this is not only related to terminal)
- viw and vaw seem to work fine now, but not sure if iW and aW are working as expected, especially inside "" or with lots of .,() symbols 

# LONG TIME IDEAS, NOT URGENT
- harpoon
- dial
- hl-lens
- still not totally happy with yank interface
- try the moonicipal task runner
- tabs (viewports) workflow. Switching, and unique buffers per tab.

# LONGER TERM GOALS
- lazygit is nice but not so vim like, replace by git ui that allows to move around with vim window motions
- debugger + DAP UI

- migrate to LAZY plugin management, simplify config by merging plugin config files by purpose to reduce number of lua files
- improve window management (now it works, consider if it's enough after some usage). Ideas: 
-- extra plugin: buffresize to keep proportions while resizing
-- reenable the autoresizing window plugin anuvyklack/windows.nvim
-- hydra window example comes with barbar integration, consider porting to cokeline
-- jump to any window mapping


# CHANGES IN workflow
this are pretty big changes that I'd like to explore someday, but are not critical right now
- try a hop/leap/ similar jump plugin
- try structural search and replace
- try yode-nvim
- try multicursors
- try ideas from this video https://www.youtube.com/watch?v=U420QymHjlA
- AI (copilot or similar)
