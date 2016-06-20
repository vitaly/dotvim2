#!/bin/bash -e

source lib/ask.sh

init .config

desc 'this is a boolean variable with default of y'
ask bool ok "understood?" y

ask num foo "give me a number" 123

desc "This variable will accept anything, even an empty string"
ask any bar "give me any string" "note that default can contain \"double\" and 'single' quotes"

desc <<END
you can use
heredocs for easy multiline
descriptions
END
ask bool isit "nice?" y

finish
info -e "\nDOME"
