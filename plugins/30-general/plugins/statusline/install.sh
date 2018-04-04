desc "Statusline provider"

enum none      '' || true
enum airline   '' || true
enum lightline '' || true

ask enum statusline "which status line plugin to install?" 1

if [ "1" != "$statusline" ]; then
  load "$(this_dir)/$statusline"
fi
