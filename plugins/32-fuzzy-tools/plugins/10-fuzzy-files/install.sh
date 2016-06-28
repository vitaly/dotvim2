desc "What plugin to use for fuzzy file search?:"

is_true use_fzf   && enum fzf '  - use ":Files" from FZF' || true
is_true unite_vim && enum unite "- use ':Unite file_rec/async:!'"
is_true ctrl_p    && enum ctrlp "- use ':CtrlP'"

if multi_enum; then
  desc_add "\nNote: this only affcts which of the options will be bound to '<leader>,'"
  ask enum fuzzy_files "files search with?" 1
else
  fuzzy_files="$(enum_value 1)"
fi

copy_files "$(this_dir)/$fuzzy_files"
