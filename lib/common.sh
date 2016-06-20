function banner()
{
  local fname="$(basename "$2")"

  case "$fname" in
    *.md)
      ;;
    *.rb|*.sh|.gitignore)
      echo
      echo "# $1 -------------------"
      echo
      ;;
    *vimrc|*vimrc.*|*.vim)
      echo
      echo "\" $1 -------------------"
      echo
      ;;
    *)
      ;;
  esac
}

# check if directory has known files and append their content to the target
function copy_files()
{
  local s="$1"
  blue $s
  for f in $(cd "$s"; find . -type f); do
    local d="${VIM_DIR}/$f"

    mkdir -pv "$(dirname "$d")"

    cyan "--- $s/$f"
    (
      banner "$s"  "$f"
      cat "$s/$f"
    ) >> "$d"
  done
}

function load()
{
  yellow "$1"
  if [ -f "$1/prompt" ]; then
    name="${1//[-\/ ]/_}"
    prompt="$(cat "$1/prompt")"
    if [ -f "$1/desc" ]; then
      desc "$(cat "$1/desc")"
    fi
    if ! ask_bool $name "$prompt" y; then
      return
    fi
  fi
  if [ -d "$1/files" ]; then copy_files "$1/files"; fi
  if [ -d "$1/plugins" ]; then load_all "$1/plugins/"*; fi
  if [ -f "$1/install.sh" ]; then source "$1/install.sh"; fi
}

function load_all()
{
  for d in "$@"; do
    load "$d"
  done
}
