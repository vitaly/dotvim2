desc "Tag search"

is_true use_fzf   && enum fzf '  - use ":Tags" from FZF' || true
is_true unite_vim && enum unite '- use ":Unite tags"' || true
is_true ctrl_p    && enum ctrlp '- use ":CtrlPTags"' || true

if multi_enum; then
  ask enum fuzzy_tags "tags search with?" 1
else
  fuzzy_tags="$(enum_value 1)"
fi

copy_files "$(this_dir)/$fuzzy_tags"
