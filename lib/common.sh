function this_file()
{
  echo "${BASH_SOURCE[1]}"
}

function this_dir()
{
  dirname "${BASH_SOURCE[1]}"
}

# banner FILE LABEL
# 'FILE' is used to determin type of banner
function banner()

{
  local file="$1"
  local label="$2"

  case "$file" in
    *.md)
      ;;
    *.rb|*.sh|*.gitignore)
      echo
      echo "# $label -------------------"
      echo
      ;;
    *vimrc|*vimrc.*|*.vim)
      echo
      echo "\" $label -------------------"
      echo
      ;;
    *)
      ;;
  esac
}

function append_to_file()
{
  local file="$1"
  local label="$2"

  local destination="${VIM_DIR}/${file}"

  mkdir -pv "$(dirname "$destination")"

  cyan "-- $file -> $destination"
  (
    banner "$file" "$label"
    cat
  ) >> "$destination"
}

# check if directory has known files and append their content to the target
function copy_files()
{
  local base="$1"
  blue $base

  for f in $(cd "$base"; find . -type f); do
    cat "$base/$f" | append_to_file "$f" "$base"
  done
}

function load()
{
  yellow "$1"

  if [ -f "$1/prompt" ]; then
    if [ -f "$1/desc" ]; then
      desc "$(cat "$1/desc")"
    fi

    exec 5< "$1/prompt"
    read name <&5
    read prompt <&5
    if ! read default <&5; then
        default=
    fi

    if ! ask_bool $name "$prompt" "$default"; then
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
