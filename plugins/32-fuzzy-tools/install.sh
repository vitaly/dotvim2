function ask_fuzzy_buffers()
{
  enum "ctrlp|unite"
  desc <<END
What plugin to use for fuzzy buffer switching?:

- ctrlp   : use ':CtrlPBuff'
- unite   : use ':Unite -start-insert buffer'

Note: both options will still be available, you just choose which one will
be bound to '<leader>b'
END
  ask enum fuzzy_buffers "Your choice?" ctrlp
}

function ask_fuzzy_files()
{
  enum "ctrlp|unite"
  desc <<END
What plugin to use for fuzzy file search?:

- ctrlp   : use ':CtrlP'
- unite   : use ':Unite -start-insert -no-split -buffer-name=files file_rec/async:!'

Note: both options will still be available, you just choose which one will
be bound to '<leader>,'
END
  ask enum fuzzy_files "Your choice?" ctrlp
}

if is_true unite_vim && ! is_true ctrl_p; then
  fuzzy_buffers=unite
  fuzzy_files=unite
elif ! is_true unite_vim && is_true ctrl_p; then
  fuzzy_buffers=ctrlp
  fuzzy_files=ctrlp
elif is_true unite_vim && is_true ctrl_p; then

  ask_fuzzy_buffers
  ask_fuzzy_files

else
  : # none
fi

function install_fuzzy()
{
  local dir="$(this_dir)/tools/$1/$(value fuzzy_$1)"
  if [ -d "$dir" ]; then
    copy_files "$dir"
  fi
}

install_fuzzy buffers
install_fuzzy files
