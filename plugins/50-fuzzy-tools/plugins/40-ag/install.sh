if is_true use_fzf; then
  copy_files "$(this_dir)/fzf"
else
  copy_files "$(this_dir)/vim-ag"
fi
