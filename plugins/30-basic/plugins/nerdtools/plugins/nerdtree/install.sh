# this file loads AFTER sub-plugins are loaded, so $nerdtree_tabs should already be set
if ! is_true nerdtree_tabs; then
  f="$(this_dir)/vimrc.bindings.notabs"

  cat "$f" | append_to_file "vimrc.bindings" "$f"
fi
