
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
