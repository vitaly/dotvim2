# Dotvim2

## What?

This is the second incarnation of my dotvim configuration

V1 can be found [here](https://github.com/astrails/dotvim)

> **IMPORTANT:** Please be sure to read the [installation](#installation) section!

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

dotvim2 seems to be stable enough at this point, I'll probably release 1.0 soon.

Note that not all plugins from v1 made it into v2, if you are missing anything
major, please let me know ;)

## Major changes

### Modularity

The number 1 major feature is that its all very modular now. Many parts are
optional, and its actually trivial to make most any other part optional too.

The modularity is achieved by switching from configuration files to
configuration file templates and generators. You no longer use the project
as-is, instead you run `make` in it, to generate your actual configuration in
your directory of choice. You can (and its recommended to) keep this generated
directory content in git as well, so that after every upgrade or configuration
change you can see the exact difference.

### dein

NeoBundle was replaced with dein. This time around it seems that this time
around vim plugin managers are ten a penny.
So I just went with [dein](https://github.com/Shougo/dein.vim), which is the
replacement from the author of NeoBundle. NeoBundle was fast, Dein supposed to
be faster still.

### TBD

<a name=installation>
## Installation

Clone this repository and run `make`.

Installation will ask you a ton of questions and then **generate** your vim
configuration in the `VIM_DIR` directory. The default is `./dist`, but you can
pass it anything through environment or arguments. e.g.:

    VIM_DIR=~/.vim make

if you use a directory other then `~/.vim` you will need to link it so that vim can find it, e.g.:

    ln -sfn YOUR_VIMDIR_PATH ~/.vim

Once your configuration is generated and linked you can run `vim`, it will
detect missing plugins and install them on the first run.

### Configuration

Your configuration choices are stored in `VIM_DIR/.config`. You can edit it
directly or just run `make edit`.

You will be asked quesions during the install only if the config file doesn't
already contain the answer.

`make reconfigure` will ask all questions all over again, with your previous
choices used as defaults.

During the installation a README file is generated in the destination
directory with just the information relevant to your own configuration chocies.

The README file in the project repository was generated with my own
configuration ;).

###  YouCompleteMe

Dotvim2 (optionally) uses YouCompleteMe for code completion (v1 used AutoComplPop).

It is a quite a bit more complex and not without its problems, but it seems to
be **the** completion plugin to use at this time.

> Note: You will need `cmake` installed if you want this to work.

> **IMPORTANT:** YouCompleteMe installation seems to be quite problematic. One
> particular problem that happened to me a lot is git failing to featch all the
> submodules from github. In case of such a failure you can try to run `make
> completion`, which will retry just tthye completion installation. you might
> need to run it seveal time until it succeeds.

## TBD

# load order

* vimrc
    * vimrc.plugins
        * ~/.vimrc.plugins
        * gvimrc.plugins
            * ~/.gvimrc.plugins
    * << here all plugins are actually loaded >>
    * after/plugin/after.vim
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

- check for `prompt.sh` and exit if it returns false
- copy files from `files` directory
- load all plugins in the `plugins` directory
- run `install.sh` if exists

TBD.

# examples

TBD

## example files structure

- `plugins`
    - `simple_directory_plugin`
        - `files`
            - `file_to_copy`
    - `plugin with a prompt`
        - `files`
            - `some file`
        - `prompt.sh`
    - `plugin_with_install_script`
        - `files`
            - `file_to_copy`
        - `other_files`
            - `other_files_to_copy`
        - `install.sh`
        - `plugins`
            - `sub-plugin1`
              ...

## plugin ordering

The plugins are loaded according to their sort order.

<a name=top>
## Contents

*   [Installation](#installation)

*   [Core Plugins](#core)
    *   [vimproc](#vimproc)
