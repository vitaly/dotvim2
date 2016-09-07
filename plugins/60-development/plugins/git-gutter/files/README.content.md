
*   <a name=gitgutter>[Vim Git Gutter](https://github.com/airblade/vim-gitgutter) ([top](#top))

    A Vim plugin which shows a git diff in the 'gutter' (sign column).
    It shows whether each line has been added, modified, and where lines have been removed.

    ![screenshot](https://raw.github.com/airblade/vim-gitgutter/master/screenshot.png)

    In the screenshot above you can see:

    * Line 15 has been modified.
    * Lines 21-24 are new.
    * A line or lines were removed between lines 25 and 26.

    Commands:

    * `:GitGutterDisable`
    * `:GitGutterEnable`
    * `:GitGutterToggle`
    * `:GitGutterSignsEnable`
    * `:GitGutterSignsDisable`
    * `:GitGutterSignsToggle`
    * `:GitGutterLineHighlightsEnable`
    * `:GitGutterLineHighlightsDisable`
    * `:GitGutterLineHighlightsToggle`

    Bindings:

    * `]c` - jump to next hunk
    * `[c` - jump to previous hunk
    * `,hs` - stage hunk
    * `,hr` - revert hunk

    There are quite some customization options. see help.
