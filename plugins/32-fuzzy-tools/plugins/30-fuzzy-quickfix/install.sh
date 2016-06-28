desc "Search for an entry in the current quickfix errors and jump to it."
desc_add "We can use several plugins for it:"

is_true unite_vim && enum unite "- use ':Unite quickfix'"
is_true ctrl_p    && enum ctrlp "- use ':CtrlPQuickfix'"

if multi_enum; then

  if is_true unite_vim; then
    desc_add "Note: 'osyo-manga/unite-quickfix' plugin will be installed if you choose 'unite' option."
  fi

  ask enum fuzzy_quickfix "quickfix search with?" 1
else
  fuzzy_quickfix="$(enum_value 1)"
fi

copy_files "$(this_dir)/$fuzzy_quickfix"
