desc "Syntax checking"

enum none "       - NONE" || true
enum ale "        - https://github.com/w0rp/ale" || true
enum syntastic "  - https://github.com/scrooloose/syntastic" || true

ask enum linter "syntax checking library" 2

if [ 1 != "$linter" ]; then
  load "$(this_dir)/$linter"
fi
