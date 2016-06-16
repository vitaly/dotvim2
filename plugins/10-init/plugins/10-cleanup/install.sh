COMMON_FILES="
.gitignore
vimrc vimrc.plugins vimrc.before vimrc.bindings vimrc.after
gvimrc.plugins gvimrc.before gvimrc.bindings gvimrc.after
README.md README.index.md README.content.md
"

function cleanup_common_files()
{
  (cd "$VIM_DIR"; rm -rf $COMMON_FILES after; touch $COMMON_FILES)
}

cleanup_common_files
