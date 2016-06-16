#!/bin/bash -e

source lib/ask.sh

init .config

ask bool ask_next "ask the next question?" y

if [ 'y' == $ask_next ];then
  ask any next "this is the next question"
fi

# or we can use the helper
is_true ask_next && ask any another "another variable"

finish
info -e "\nDOME"
