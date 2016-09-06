#!/bin/bash -e

if [[ "-v" == "$1"  ]]; then
  shift
  VERBOSE=1
fi
ASK_VERBOSE="$VERBOSE"

source vendor/ask.sh/lib/ask.sh

if [ -z "$VIM_DIR" ]; then
  die "please define VIM_DIR"
fi

VIM_DIR="$(cd "$VIM_DIR"; pwd)"

function non_dotvim2_dir_warning() {
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

if [ -d "$VIM_DIR" ]; then
  if [ ! -d "$VIM_DIR/dein" ]; then
    non_dotvim2_dir_warning
  fi
else
  mkdir -pv "$VIM_DIR"
fi

init ${VIM_DIR}/.config

if [ "$VIM_DIR" != "$(cd ~/.vim; pwd)" ]; then

  desc <<-END
Your installation directory is $VIM_DIR
     Make sure you link this directory into ~/.vim

> Note: you can override the default directory by passing VIM_DIR to make: 'VIM_DIR=... make'
END
  ask bool vimdir_warning "I understand" y
fi

source lib/common.sh

load_all plugins/*

finish
bold
info -e "\nDOME"