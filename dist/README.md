# Dotvim v2

## What?

This is the second incarnation of my dotvim configuration

V1 can be found [here](https://github.com/astrails/dotvim)

## Why

Over the years V1 became too bloated, and hard to update and fix. Once
something went-in, its hard to remove it, since somebody might be using it.

Also, people kept sending me patches with their favorite plugins, which might
not necessarily be useful for everybody.

The result is that the configuration became way too big and slow.

## Status

This is an early work-in-progress. I started using it already, but it might be too early for general consumption.

> Note: This readme is still not nearly ready. look at the code, or just try to run it.

## Installation

The main idea is that vim configuration is not a static file, but instead is
generated from templates according to user input. Default genration directoty
is `dist` under the source tree, but you can change it by passing `VIM_DIR`
environment variable. e.g. `VIM_DI=~/.dotvim2 make`

Then you can link your `~/.vim` to your old config or this one whily you are
playing with it.

You can configure dotvim2 in many ways, but the default installation (`make`) will just use the supplied default.

You can re-configure it yourself by running `make reconfigure`, or editing `.config` files in the destination directory.

All choices are saved for the next time, so when a new version comes out, your old answers will be preserved.

During the installation a README file is generated in the destination directory. And example one can be seen [here](dist/README.md)

## TBD

# load order

- vimrc
  - vimrc.plugins
  - [gvimrc.plugins]
  - [~/.vimrc.plugins]
  - vimrc.before
  - [gvimrc.before]
  - [~/.vimrc.before]
  - after/plugin/after.vim
    - vimrc.after
    - [gvimrc.after]
    - [~/.vimrc.after]

each plugin can add con add content to files in the target vim directory by
simply having the corresponding files present in the `plugin/files` directory

e.g. if plugin foo has file `plugins/files/directory/files`, then this
file's content will be added to `~/.vim/directory/files`

plugins found in the `plugins` subdirectory will be automatically loaded as well.

To make sure each such files will be re-created appropriately upon each install
run, they have to be cleaned up.. `10-init/plugins/10-cleanup` plugin takes
care of the standard ones, if you need a new one, you might need to clean it up
your self. place it in `000=-....` plugin directory to make sure it is called
before any other plugin tries to add content to it.

if a plugin has an `install.sh` file in the directory, it will be sourced.

if a plugin has a `prompt` dile in the directory, its loading will be
conditioned upon asking the user. The format os the `prompt` files is simple.
Its 3 lines. 1st line is the name of the variable that will hold the answer. It
must be globablly unique. The 2nd line is the promt, thay is displayed to the
user. And the 3rd line is the default answer. If its absent, 'y' is presumed.

Note that the `prompt` file only assumes a simple yes/now question. If you want
something more comples create an `install.sh` files and look into
`vendor/ask.sh` for examples of how to ask other kind of questions.

TBD.

# examples

TBD

## example files structure

    - plugins
      - simple_directory_plugin
        - files
          - file_to_copy
      - plugin_with_install_script
        - files
          - file_to_copy
        - other_files
          - other_files_to_copy
        - install.sh
        - plugins
          - sub-plugin1
            ...

## plugin ordering

The plugins are loaded according to their sort order.
<a name=top>
## Contents

* [Installation](#installation)
* [Core Plugins](#core)
  * [vimproc](#vimproc)
  * [unite.vim](#unite.vim)
* [Global settings](#globals)
* [Basic Plugins](#basic)
  * [CtrlP](#CtrlP)
  * [greplace.vim](#greplace.vim)
  * [Gundo](#gundo)
  * [nerdtree](#nerdtree)
  * [nerdtree-git](#nerdtree-git)
  * [nerdtreetabs](#nerdtreetabs)
  * [nerdcommenter](#nerdcommenter)
  * [vim-repeat](http://github.com/tpope/vim-repeat)

    Use the repeat command "." with supported plugins

  * [vim-ag](#vim-ag)

    `ag` searching integration
  * [YankRing.vim](#YankRing.vim)
* [Completion](#completion)
* [Plugins for Developers](#devplugins)
  * [delimitMate](#delimitMate)

    automatic closing of quotes, parenthesis, brackets, etc.

  * [editorconfig](#editorconfig)
  * [vim-endwise](#vim-endwise)
  * [vim-fugitive](#vim-fugitive)
  * [vim-gitgutter](#gitgutter)

    git diff in the gutter (sign column) and stages/reverts hunks

  * [vim-surround](#vim-surround)
  * [syntastic](#syntastic) syntax checking on save
  * [tmux-navigator](#tmux-navigator)
* [Development languages and syntax support](#languages)
  * [Ruby Support](#ruby)
    * [vim-bundler](#vim-bundler) bundler integration
    * [vim-rake](#vim-rake) rake integration
    * [vim-textobj-rubyblock](#vim-textobj-rubyblock) A custom text object for selecting ruby blocks (ar/ir)
    * [vim-ruby-refactoring](#vim-ruby-refactoring)
    * [blockle.vim](#blockle) toggle ruby blocks style
    * [Ruby on Rails Support](#rails)
      * [vim-rails](#vim-rails)
      * [vim-rspec](#vim-rspec) lightweight Rspec runner for Vim
      * [apidock.vim](#apidock.vim) apidock.com docs integration
      * [vim-i18n](#i18n) Rails i18n extraction plugin
* [Extras](#extras)
  * [unite-colorscheme](#unite-colorscheme)
  * [vim-airline](#airline)

    better looking statusline

  * [Themes](#themes)

<a name=installation>
### Installation

TBD

<a name=core>
### "Core" Plugins:

*   <a name=vimproc>vimproc

    TBD

*   <a name=unite.vim>[unite.vim][unite] ([top](#top))

    Search and display information from arbitrary sources like files, buffers,
    recently used files or registers.

    This plugins is too powerful to present here, read the [documentation][unite].

    See [unite-colorscheme](#unite-colorschema) for example command to use
    Unite to choose a colorscheme.

[unite]: https://github.com/Shougo/unite.vim

<a name=globals>
## Global settings

TBD

<a name=basic>
## "Basic" Plugins:

*   <a name=CtrlP>[CtrlP](https://github.com/ctrlpvim/ctrlp.vim) ([top](#top))

    Fuzzy file, buffer, mru, tag, etc finder.

    * `,,` - `CtrlPMixed` - fuzzy find files, buffers, and MRU.
    * `,.` - `CtrlPClearCache` followed by `CtrlPMixed` - clears the cache
      before search
    * `,m` - `CtrlPBufTag` - search tags in the current buffer
    * `,M` - `CtrlPBufTagAll` - search tags in all buffers
    * `,l` - `CtrlPLine` - fuzzy search lines in all opened buffers
    * `,b` - `CtrlPBuff` - fuzzy search open buffers

   This plugin has lots of options, see `:h ctrlp` for more.

*   <a name=greplace.vim>[greplace.vim](http://github.com/vim-scripts/greplace.vim) ([top](#top))

    Replace a pattern across multiple files interactively

    Use `:Gsearch` to search for a pattern. Edit the result buffer to your
    liking, then `:Greplace` to incorporate your edits into the source files

    * `:Gsearch` - Search for a given pattern in the specified group of files
      and display the matches in the replace buffer.
    * `:Gbuffersearch` - Search for a given pattern in all the buffers in the Vim buffer list.
    * `:Greplace` - Incorporate the modifications from the replace buffer into
      the corresponding files.

*   <a name=gundo>[Gundo](https://github.com/sjl/gundo.vim) ([top](#top))

    Homepage is [here](http://sjl.bitbucket.org/gundo.vim/)

    Graphs your vim undo tree in a side window.

    * `,u` - toggle undo window
    * `:h gundo.txt` - more help

*   <a name=nerdtree>[nerdtree](http://github.com/scrooloose/nerdtree) ([top](#top))

    vim script to give you a tree explorer

    * `Ctrl-P` - open directory browser (**Note:** this is now handled by
      [nerdtree-tabs](#nerdtreetabs) (see below))
    * `,p` - to find and highlight the currently open file in the tree

*   <a name=nerdtree-git>[nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) ([top](#top))

    A plugin of NERDTree showing git status flags. Works with the LATEST
    version of NERDTree.

    You can configure custom status symbols:

        let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

*   <a name=nerdtreetabs>[nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs) ([top](#top))

    NERDTree and tabs together in Vim, painlessly

    * `Ctrl-P` - open directory browser

*   <a name=nerdcommenter>[nerdcommenter](http://github.com/scrooloose/nerdcommenter) ([top](#top))

    Vim plugin for intensely orgasmic commenting

    * `,/` - toggle comment
    * `,cc` - add commenting
    * `,cu` - Uncomment
    * check docs for more

*   <a name=vim-ag>[vim-ag](https://github.com/rking/ag.vim) ([top](#top))

    Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'

    * `,k` - `:Ag ` - open prompt for entering search term

*   <a name=YankRing.vim>[YankRing.vim](http://github.com/vim-scripts/YankRing.vim) ([top](#top))

    Maintains a history of previous yanks, changes and deletes

    * `,y` to show the yankring
    * `,[`/`,]` - to cycle the just-pasted text though the yankring.
    * `:h yankring.txt` and `:h yankring-tutorial` for more

<a name=completion>
## Completion

*   <a name=youcompleteme>[YouCompleteMe](http://valloric.github.io/YouCompleteMe) ([top](#top))

    A code-completion engine for Vim

    See [documentation](http://valloric.github.io/YouCompleteMe).

<a name=devplugins>
## Plugins for Developers:

*   <a name=delimitMate>[delimitMate](http://github.com/Raimondi/delimitMate) ([top](#top))

    auto-completion for quotes, parens, brackets, etc. in insert mode.

*   <a name=editorconfig>[editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) ([top](#top))

    [.editorconfig](http://editorconfig.org) file support.

*   <a name=vim-endwise>[vim-endwise](http://github.com/tpope/vim-endwise) ([top](#top))

    Wisely add "end" in ruby, endfunction/endif/more in vim script, etc

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

    *    `,g`

         shortcut to run :Ggrep

    *   `//`

        global git search for the word under the cursor for for selection (in visual mode)

    *   `:Gblame`

        Run git-blame on the file and open the results in a
        scroll bound vertical split.  Press enter on a line to
        reblame the file as it was in that commit.

    Much more in the plugin's doc

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

*   <a name=vim-surround>[vim-surround](http://github.com/tpope/vim-surround) ([top](#top))

    Delete/change/add parentheses/quotes/XML-tags/much more with ease

    * `dsX` - delete surround X
    * `csXY` - change surround X with Y
    * `s/S` in visual mode - wrap selection
    * `ysMovementX` - surround movement with X

    You should REALLY read the docs if you want to use this one

*   <a name=syntastic>[syntastic](http://github.com/scrooloose/syntastic) ([top](#top))

    syntax checking plugin

    it will display the number of syntax errors in the current file in the vim's status line.

    use `:Errors` to display a window detailing the errors

*   <a name=tmux-navigator>[tmux-navigator](http://github.com/christoomey/vim-tmux-navigator) ([top](#top))

    tmux + vim = love

    to change default mappings define:

        let g:tmux_navigator_no_mappings = 1

    The default mappings are:

        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
        nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

    TBD: make this configurable through ask.sh

<a name=languages>
## Development languages and syntax support

<a name=ruby>
### Ruby Support

*   <a name=vim-bundler>[vim-bundler](https://github.com/tpope/vim-bundler) ([top](#top))

    Lightweight support for Ruby's Bundler

    * `gf` when standing over a gem name in a Gemfile will go to gem's directory
    * `:Bopen NAME` does bundle open NAME - opens gem NAME's lib diretory in the current window.
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

    * `,rap`  :RAddParameter           - Add Parameter(s) to a method
    * `,rcpc` :RConvertPostConditional - Convert Post Conditional
    * `,rel`  :RExtractLet             - Extract to Let (Rspec)
    * `,rec`  :RExtractConstant        - Extract Constant (visual selection)
    * `,relv` :RExtractLocalVariable   - Extract Local Variable (visual selection)
    * `,rit`  :RInlineTemp             - Inline Temp. replace temp parameter by direct function call
    * `,rrlv` :RRenameLocalVariable    - Rename Local Variable (visual selection/variable under the cursor
    * `,rriv` :RRenameInstanceVariable - Rename Instance Variable (visual selection)
    * `,rem`  :RExtractMethod          - Extract Method (visual selection)

*   <a name=blockle)>[blockle.vim](https://github.com/vim-scripts/blockle.vim) ([top](#top))

    Toggle ruby blocks style, e.g `{}` to `do .. end`

    * `,B` - toggle block style

    > NOTE: thre is an unfortunate interaction with delimitMate, the opening
    > brase gets completed. i.e. you get `{} ... }`


<a name=rails>
#### Ruby on Rails Support

*   <a name=vim-rails>[vim-rails](http://github.com/tpope/vim-rails) ([top](#top))

    Ruby on Rails: easy file navigation, enhanced syntax highlighting, and more

    * `:AV` - open "alternate" file in a new vertical split
    * `:AS` - open "alternate" file in a new horizontal split
    * `:RV` - open "related" file in a new vertical split
    * `:RS` - open "related" file in a new horizontal split
    * `:Rextract` - extract partial (select text for extraction first)
    * `:Rinvert` - takes a self.up migration and writes a self.down.
    * `gf` - remapped to take context into account. recognizes models
      associations, partials etc.
    * `:h rails` for much more info ;)


*   <a name=apidock.vim>[apidock.vim](https://github.com/alexandrov/apidock.vim) ([top](#top))

    Vim plugin that searches http://apidock.com Ruby, Rails, and RSpec docs from within Vim.

    * `RR` - Search the Rails docs for the word under the cursor.
    * `RB` - Search the Ruby docs for the word under the cursor.
    * `RS` - Search the RSpec docs for the word under the cursor.

*   <a name=vim-rspec>[vim-rspec](https://github.com/josemarluedke/vim-rspec) ([top](#top))

    Lightweight Rspec runner for Vim.

    Commands are self explanatory:

    * `:call RunCurrentSpecFile()`
    * `:call RunNearestSpec()`
    * `:call RunLastSpec()`

    Bindings:

    * `,r` - `RunNearestSpec`

*   <a name=i18n>[vim-i18n](https://github.com/stefanoverna/vim-i18n) ([top](#top))

    Extracts i18n strings from source files into .yml file.

    * `,z` - extract selected string

<a name=extras>
## Extras

*   <a name=unite-colorscheme>[unite-colorscheme](https://github.com/ujihisa/unite-colorscheme) ([top](#top))

    A [unite.vim](#unite.vim) plugin. Privides source to choose color schemes.

    Try:

    `:Unite -no-start-insert -auto-preview colorscheme`

    Then try to navigate up and down and see what happens ;)

    > Note: actually this command aliased as `:THEME`

*   <a name=airline>[vim-airline](https://github.com/bling/vim-airline) ([top](#top))

    Lean & mean status/tabline for vim that's light as air.

    A better replacement for vim-powerline. Optimized for speed; it loads in
    under a millisecond.

    [Install fonts](https://github.com/bling/vim-airline#integrating-with-powerline-fonts)
    for best results.

*   <a name=themes>Themes ([top](#top))

    The following colorschemes are available:

    * solarized

      TMD

    * tomorrow

      TMD

    * vividchalk

      TMD
