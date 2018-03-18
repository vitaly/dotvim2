OLD_FILES="
vimrc.before gvimrc.before
vimrc.bindings gvimrc.bindings
filetype.vim
"
COMMON_FILES="
.gitignore
vimrc vimrc.plugins vimrc.after
gvimrc.plugins gvimrc.after
README.md README.index.md README.content.md
"
COMMON_DIRS="
after ftplugin colors
snippets
spell
"

( cd "$VIM_DIR"; rm -f $OLD_FILES $COMMON_FILES; rm -rf $COMMON_DIRS; touch $COMMON_FILES )
