#!/bin/bash -e

source lib/ask.sh

init .config

enum "aaa" "    - This does AAAA"
enum "bbb ccc" "- This does some bbb ccc"
enum "ddd"
desc 'this is a variable with several valid values'
ask enum variant "you choice?"

echo chosen: $variant

finish
info -e "\nDOME"

