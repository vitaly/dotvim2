desc "Search through the lines in all loaded buffers"

is_true use_fzf  && enum fzf '  - use ":Lines" from FZF' || true
is_true ctrl_p   && enum ctrlp '- use ":CtrlPLine"' || true

if multi_enum; then
  ask enum fuzzy_lines "lines search with?" 1
else
  fuzzy_lines="$(enum_value 1)"
fi

copy_files "$(this_dir)/$fuzzy_lines"
