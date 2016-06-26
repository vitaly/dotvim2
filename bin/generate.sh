#!/bin/bash -e

source vendor/ask.sh/lib/ask.sh

if [ -z "$VIM_DIR" ]; then
  die "please define VIM_DIR"
fi

mkdir -pv "$VIM_DIR"

if [[ "-v" == "$1"  ]]; then
  shift
  VERBOSE=1
fi

init ${VIM_DIR}/.config

source lib/common.sh

load_all plugins/*

finish
info -e "\nDOME"