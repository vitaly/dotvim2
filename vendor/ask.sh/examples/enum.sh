#!/bin/bash -e

source lib/ask.sh

init .config

desc 'this is a variable with several valid values'
enum "aaa|bbb ccc|ddd"
ask enum variant "you choice?"

echo chosen: $variant

finish
info -e "\nDOME"

