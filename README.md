# Dotvim2

## What?

This is the second incarnation of my dotvim configuration

V1 can be found [here](https://github.com/astrails/dotvim)

> **IMPORTANT:** Please see [Status](#status) section below.

## Why

Over the years V1 became too bloated, and hard to update and fix. Once
something went-in, its hard to remove it, since somebody might be using it.

Also, people kept sending me patches with their favorite plugins, which might
not necessarily be useful for everybody.

The result is that the configuration became way too big and slow.

So my goals for this v2 release are:

* easy customization and extensibility. It should be easy to add **optional**
  functionality, plugins, bindings etc.  with dotvim v1 its easy to make any
  plugin conditionally loadable, any value to be configurable (and have a
  default), etc.

* upgradeability. Your customizations should easily survive version upgrades. If
  you decided that you don't need 'ruby support', you should still have it
  'off' next time you upgrade the version. But it should be trivial to bring it
  back if you ever need to.

* minimal boilerplate. You can always achieve configurability by defining a ton
  of vim variables and checking them with 'ifs' all over the place. This is
  ugly and not productive. Dotvim2 uses a shell library to keep, update, and
  merge your "choices" in a shell script file `.config`. More info TBD.

## Status

This is an early work-in-progress. I'm  still figuring things out, and moving
stuff around quite a bit.

I am using it as my primary vim config, but it might be too early for general
consumption. That being said, it is already useful, and (at least in my
experience) works better and faster then the old one.

What **might** come next:

* many "features" can be implemenetd with different 'backends', e.g. bufferlist
  is currently done with `:CtrlPBuffer`, but there is also `Unite -start-insert buffer`.
  And there is FZF which I'm yet to look into.
  I'm currently thinking about trying those variants, to see which one I
  prefer. And I might end up having all those variants configurable during the
  installation (as its pretty much a matter of prefernce, and someone might
  prefer the old way)

* I'm not completely happy with the file structure. While its very easy to add
  and change stuff, its a bit too 'messy', with too many directory levels etc.
  I might play with layout to make it more 'flat'.

* Also thinking about using single file with "magic" comments to separate into
  various destinations instead of having a directory with many files.

  e.g. instead of having `files/vimrc.bindings`, `files/vimrc.before`,
  `files/vimrc.after` for some plugin, there would be just `files` **file**
  with comments separating into various destinations. This is pretty much
  speculation at this point. Ideas area welcome ;)

* more language specific configurations. I haven't yet transfered all my
  language configs from v1, as I want to only add stuff I'm using **right
  now**.

## Major changes

The number 1 major feature is that its all very modular now. Many parts are
optional, and its actually trivial to make most any other part optional too.

The modularity is achieved by switching from configuration files to
configuration file templates and generators. You no longer use the project
as-is, instead you run `make` in it, to generate your actual configuration in
your directory of choice. You can (and its recommended to) keep this generated
directory content in git as well, so that after every upgrade or configuration
change you can see the exact difference.



## Installation

The main idea is that vim configuration is not a static file, but instead is
generated from templates according to user input. Default generation directory
is `dist` under the source tree, but you can change it by passing `VIM_DIR`
environment variable. E.g. `VIM_DIR=~/.dotvim2 make`

Then you can link your `~/.vim` to your old config or this one when you are
playing with it.

You can configure dotvim2 in many ways, but the default installation (`make`)
will just use the supplied default.

You can re-configure it yourself by running `make reconfigure`, or editing
`.config` files in the destination directory.

All choices are saved for the next time, so when a new version comes out, your
old answers will be preserved.

During the installation a README file is generated in the destination
directory. And example one can be seen [here](dist/README.md)

## TBD

# load order

* vimrc
  * vimrc.plugins
    * ~/.vimrc.plugins
    * gvimrc.plugins
      * ~/.gvimrc.plugins
  * vimrc.before
    * ~/.vimrc.before
    * gvimrc.before
      * ~/.gvimrc.before
  * << here all plugins are actually loaded >>
  * after/plugin/after.vim
    * vimrc.bindings
      * ~/.vimrc.bindings
      * gvimrc.bindings
        * ~/.gvimrc.bindings
    * vimrc.after
      * ~/.vimrc.after
      * gvimrc.after
        * ~/.gvimrc.after

Each plugin can add content to files in the target vim directory by simply
having the corresponding files present in the `plugin/files` directory

E.g. if plugin foo has file `plugins/files/directory/files`, then this file's
content will be added to `~/.vim/directory/files`

Plugins found in the `plugins` subdirectory will be automatically loaded as
well.

To make sure each such files will be re-created appropriately upon each install
run, they have to be cleaned up.. `10-init/plugins/10-cleanup` plugin takes
care of the standard ones, if you need a new one, you might need to clean it up
your self. place it in `000=-....` plugin directory to make sure it is called
before any other plugin tries to add content to it.

If a plugin has a `prompt.sh` file in the directory, its loading will be
conditioned on evaling this script.

If the script "fails" (i.e. non-zero exit code), then the plugin will not be loaded.

> IMPORTANT: The prompt script is evaled in the contenxt of the generator, so it has
> access to all the state and functions, so it can run `ask...` functions, etc.

Note that prompt.sh should usually only ask simple question and return
true/false, if you want something more complex create an `install.sh` instead.

If a plugin has an `install.sh` file in the directory, it will be sourced.

so the logic flow is as follows:

- check for prompt.sh and exit if it returns false
- copy files from `files` directory
- load all plugins in the `plugins` directory
- run `install.sh` if exists

TBD.

# examples

TBD

## example files structure

    * plugins
      * simple_directory_plugin
        * files
          * file_to_copy
      * plugin_with_install_script
        * files
          * file_to_copy
        * other_files
          * other_files_to_copy
        * install.sh
        * plugins
          * sub-plugin1
            ...

## plugin ordering

The plugins are loaded according to their sort order.
