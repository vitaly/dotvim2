desc "What plugin to use for fuzzy buffer switching?:"

is_true unite_vim && enum unite '- use ":Unite buffer"'|| true
is_true ctrl_p    && enum ctrlp '- use ":CtrlPBuff"' || true

if multi_enum; then
  desc_add "\nNote: this only affcts which of the options will be bound to '<leader>b'"
  ask enum fuzzy_buffers "buffer search with?" 1
else
  fuzzy_buffers="$(enum_value 1)"
fi

copy_files "$(this_dir)/$fuzzy_buffers"
