#!/bin/bash -e

source vendor/ask.sh/lib/ask.sh

if [ -z "$VIM_DIR" ]; then
  die "please define VIM_DIR"
fi

init ${VIM_DIR}/.config

source lib/common.sh

load_all plugins/*

finish
info -e "\nDOME"