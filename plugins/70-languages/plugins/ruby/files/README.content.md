
<a name=ruby>
### Ruby Support

*   <a name=vim-bundler>[vim-bundler](https://github.com/tpope/vim-bundler) ([top](#top))

    Lightweight support for Ruby's Bundler

    * `gf` - when standing over a gem name in a Gemfile will go to gem's directory
    * `:Bopen NAME` - does bundle open NAME - opens gem NAME's lib diretory in the current window.
    * `:Bundle` - runs bundler

*   <a name=vim-rake>[vim-rake](https://github.com/tpope/vim-rake) ([top](#top))

    TBD

*   <a name=vim-textobj-rubyblock>[vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock) ([top](#top))

    A custom text object for selecting ruby blocks.

    In other words it teaches vim to understand what is ruby block, just like vim already understands what is word, paragraph, sentence etc.

    It works with begin/end, if/else/end etc.

    * `var` - select ruby block around the cursor including begin/end
    * `vir` - select insides of a ruby block around the cursor not including begin/end
    * `dar` - delete ruby block around the cursor
    * etc...

    Some 'trickier' usage patterns.

    * `varar` - select the ruby block that is around the ruby block that is around the cursor. including begin/end
    * `vararir` - select insides of the ruby block that is around the ruby block that is around the cursor. not including begin/end
    * ...


*   <a name=vim-ruby-refactoring>[vim-ruby-refactoring](https://github.com/ecomba/vim-ruby-refactoring) ([top](#top))

    Refactoring tool for Ruby in vim!

    * `<leader>rap`  :RAddParameter           - Add Parameter(s) to a method
    * `<leader>rcpc` :RConvertPostConditional - Convert Post Conditional
    * `<leader>rel`  :RExtractLet             - Extract to Let (Rspec)
    * `<leader>rec`  :RExtractConstant        - Extract Constant (visual selection)
    * `<leader>relv` :RExtractLocalVariable   - Extract Local Variable (visual selection)
    * `<leader>rit`  :RInlineTemp             - Inline Temp. replace temp parameter by direct function call
    * `<leader>rrlv` :RRenameLocalVariable    - Rename Local Variable (visual selection/variable under the cursor
    * `<leader>rriv` :RRenameInstanceVariable - Rename Instance Variable (visual selection)
    * `<leader>rem`  :RExtractMethod          - Extract Method (visual selection)

*   <a name=blockle)>[blockle.vim](https://github.com/vim-scripts/blockle.vim) ([top](#top))

    Toggle ruby blocks style, e.g `{}` to `do .. end`

    * `<localleader>B` - toggle block style

    > NOTE: there is an unfortunate interaction with delimitMate, the opening
    > brase gets completed. i.e. you get `{} ... }`

