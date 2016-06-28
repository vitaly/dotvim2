desc <<END
By default only <tab> and arrows are used to complete from the list, answer
'yes' here to add <enter> to the list.

END
if ask_bool youcomplete_on_enter "Use ENTER as completion key" n; then

  cat <<END | append_to_file "vimrc.before" "$(this_file)"
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
END

fi
