desc "Tag search"

enum                      yankring '- use dedicated yankring plgin'
is_true unite_vim && enum unite '-    use ":Unite history/yank"' || true


if multi_enum; then
  desc "YankRing is better IMHO, but you might prefer a unified interface ;)"
  ask enum fuzzy_yank "yank history search with?" 1
else
  fuzzy_yank="$(enum_value 1)"
fi

copy_files "$(this_dir)/$fuzzy_yank"
