#!/bin/bash -e

source lib/ask.sh

init .config

# lets define a script that outputs a vimscript file

# this will be our vim output file
CUSTOM="foo.vim.new"

# lets clean the file first
rm -fv "$CUSTOM"
touch "$CUSTOM"

desc "this is a global boolean variable"
ask bool foo "Should we foo?" y

if is_true foo; then
  echo "let g:foo = 1"
else
  echo "let g:foo = 0"
fi >> "$CUSTOM"

# once all finished we can 'commit' the vim config file
mv -fv "$CUSTOM" "foo.vim"

finish
info -e "\nDOME"
