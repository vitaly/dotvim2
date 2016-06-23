COMMON_FILES="
.gitignore
vimrc vimrc.plugins vimrc.before vimrc.bindings vimrc.after
gvimrc.plugins gvimrc.before gvimrc.bindings gvimrc.after
README.md README.index.md README.content.md
"
COMMON_DIRS="
after ftplugin colors
snippets
spell
"

function cleanup_common_files()
{
  ( cd "$VIM_DIR"; rm -f $COMMON_FILES; rm -rf $COMMON_DIRS; touch $COMMON_FILES )
}

cleanup_common_files
