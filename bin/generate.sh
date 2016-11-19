#!/bin/bash -e

if [[ "-v" == "$1"  ]]; then
  shift
  VERBOSE=1
fi
ASK_VERBOSE="$VERBOSE"

source vendor/ask.sh/lib/ask.sh

function non_dotvim2_dir()
{
  [ -d "$VIM_DIR" -a ! -d "$VIM_DIR/dein" ]
}

function non_dotvim2_dir_warning()
{
  red "> Your vim directory $VIM_DIR already exists but doesn't seem to be created by dotvim2"
  bold
  red -e "> Proceed at your own risk!!!\n"
  green -n "Continue? "
  cyan -n "(y/N): "
  local ok
  read ok
  echo
  if ! is_true ok; then
    yellow -e "move or remove the directory and run make again.\n"
    bold
    blue -e "> Note: you can override the default directory by passing VIM_DIR to make: 'VIM_DIR=... make'\n"
    exit 1
  fi

  bold
  yellow -e "> WARNING: installing into non dotvim2 directory!\n\n\n"
}

function non_standard_dir()
{
  [ ! -d ~/.vim ] || [ "$VIM_DIR" != "$(cd ~/.vim; pwd)" ]
}

function non_standard_dir_warning()
{
  desc <<END
Your installation directory is $VIM_DIR
     Make sure you link:
       ~/.vim -> "$VIM_DIR"
     Depending on your version of vim you might also need to link:
       ~/.vimrc -> "$VIM_DIR/vimrc"

> Note: you can override the default directory by passing VIM_DIR to make: 'VIM_DIR=... make'
END
  ask bool vimdir_warning "I understand" y
}

function no_vimrc()
{
  test ! -f ~/.vimrc
}

function no_vimrc_warning()
{
  desc <<END
You don't have ~/.vimrc file. Newer versions of Vim can use ~/.vim/vimrc, but older versions require ~/.vimrc
so you might need to create a link.
END

enum ignore "- I'll handle the link myself"
enum link "  - create link ~/.vimrc -> '$VIM_DIR/vimrc'"

ask enum vimrc_link "How to handle missing ~/.vimrc link?"

case $vimrc_link in
  ignore) ;;
  link) ln -sfvn "$VIM_DIR/vimrc" ~/.vimrc
esac
}

function init_vimdir()
{
  [ -n "$VIM_DIR" ] || die "please define VIM_DIR"

  if non_dotvim2_dir; then
    non_dotvim2_dir_warning
  else
    mkdir -pv "$VIM_DIR"
  fi

  VIM_DIR="$(cd "$VIM_DIR"; pwd)"

  init ${VIM_DIR}/.config

  if non_standard_dir; then
    non_standard_dir_warning
  fi

  if no_vimrc; then
    no_vimrc_warning
  fi
}

init_vimdir

source lib/common.sh

load_all plugins/*

finish
bold
info -e "\nDONE: $VIM_DIR"
