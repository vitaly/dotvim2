
*   <a name=vim-fugitive>[vim-fugitive](http://github.com/tpope/vim-fugitive) ([top](#top))

    A Git wrapper so awesome, it should be illegal

    *    `:Gstatus`

         Bring up the output of git-status in the preview
         window.  Press `-` to stage or unstage the file on the
         cursor line.  Press `p` to do so on a per hunk basis
         (--patch).  Press `C` to invoke :Gcommit.

    *    `:Gcommit [args]`

         A wrapper around git-commit.

    *    `:Ggrep [args]`

         :grep with git-grep as 'grepprg'.

    *    `<leader>gg`

         shortcut to run :Ggrep

    *   `<leader>gw`

        global git search for the word under the cursor for for selection (in visual mode)

    *   `:Gblame`

        Run git-blame on the file and open the results in a
        scroll bound vertical split. Press enter on a line to
        reblame the file as it was in that commit.

    Much more in the plugin's doc

*   <a name=vim-merginal>[Merginal](http://github.com/vim-scripts/Merginal) ([top](#top))

    * `:Merginal` - open branch list window

    * `D`  - delete branch under cursor
    * `C`  - checkout branch under cursor
    * `M`  - merge branch under cursor
    * `rb` - rebase current branch against the branch under cursor
    * `rn` - rename branch agains the branch under cursor

    * `:h merginal-branch-list` to see more bindings.

    * `:h merginal` - to see the complete help
