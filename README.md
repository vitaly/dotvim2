# load order

- vimrc
  - vimrc.plugins
  - [gvimrc.plugins]
  - vimrc.before
  - [gvimrc.before]
  - after/plugin/after.vim
    - vimrc.after
    - [gvimrc.after]

each plugin can add con add content to files in the target vim directory
 by simply having the corresponding files
present in the `plugin/files` directory

e.g. if plugin foo has file `plugins/files/directory/files`, then this
file's content will be added to `~/.vim/directory/files`

To make sure each such files will be re-created appropriately upon each install
run, they have to be cleaned up.. `000-init` plugin takes care of the standard
ones, if you need a new one, you might need to clean it up your self. place it
in `000=-....` plugin directory to make sure it is called before any other
pluging tries to add content to it

# plugins directory structure

A plugin is a directory with a `plugin.sh` file or `files` directory in it

if `plugin.sh` files exists, it is run, and it will determin the rest of the
behaviour, otherwise the files from the `files` directory are copied using the
`copy_files` helper

`copy_files [dir]` will detect and copy/apppend files from the dir into the
installlation dir


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

## plugin ordering

The plugins are loaded according to their sort order.

by conventions the following order is used


- 00x   - cleanup
- 01x   - initial setup
- 019   - will setup and commit the state into git (configurable)
