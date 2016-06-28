function verbose()
{
  if [ -n "$VERBOSE" ]; then
    true
  else
    false
  fi
}

function v()
{
  if verbose; then
    "$@"
  fi
}

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

  v cyan "-- $file -> $destination"
  (
    banner "$file" "$label"
    cat
  ) >> "$destination"
}

# copy files from directory into target
# will fail if directory doesn't exist
function copy_files()
{
  local base="$1"
  [ -d "$base" ] || die "directory $base not found"

  _copy_files "$@"
}

# copy files from directory into target
# will ignore if directory doesn't exist
function _copy_files()
{
  local base="$1"

  if [ ! -d "$base" ]; then
    return
  fi

  v blue $base

  for f in $(cd "$base" && find . -type f); do
    cat "$base/$f" | append_to_file "$f" "$base"
  done
}

function load()
{
  v yellow "$1"

  if [ -f "$1/prompt.sh" ]; then
    if ! eval "$(cat "$1/prompt.sh")"; then
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
