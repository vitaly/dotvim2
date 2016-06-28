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

mkdir -pv "$VIM_DIR"

init ${VIM_DIR}/.config

source lib/common.sh

load_all plugins/*

finish
info -e "\nDOME"