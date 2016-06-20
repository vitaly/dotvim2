# this script directory
ASK_LIB=$(cd "`dirname ${BASH_SOURCE[0]}`"; pwd)

source "$ASK_LIB/colors.sh"
source "$ASK_LIB/utils.sh"

# check for '-f' parameter
if [ -z "$DO_NOT_PARSE_FORCE" ]; then
  if [[ "-f" == "$1"  ]]; then
    shift
    ASK_FORCE=1
  else
    ASK_FORCE=
  fi
fi

# init PATH_TO_SAVE_TO [force?]
function init()
{
  [ -n "$1" ] || raise "missing output file name"
  OUT="$1"

  # loading results of the previous run
  [ -e "$OUT" ] && source "$OUT"

  TMPOUT="${OUT}.new"
  rm -f "$TMPOUT"
  touch "${TMPOUT}"
}

function finish()
{
  mv "$TMPOUT" "$OUT"
}

# SUPPORT FUNCTIONS

DESC=
function desc()
{
  if [ -n "$1" ]; then
    DESC="$*"
  else
    DESC="`cat`"
  fi
}

function _prompt()
{
  green -n "${1}"
  [ -n "$2" ] && cyan -n " [$2]"
  green -n ": "
}

function _validate()
{
  case "$1" in
    bool*) echo "$2" | grep -qiE '^(y(es)?|no?)$' ;;
    num*)  echo "$2" | grep -qiE '^[0-9]+$' ;;
    word)  echo "$2" | grep -qiE '^[a-z]+$' ;;
    sym*)   echo "$2" | grep -qiE '^[a-z0-9_]+$' ;;
    simple) echo "$2" | grep -qiE '^[a-z0-9_ ]+$' ;;
    str*)  [ -n "$2" ] ;;
    any*)  true ;;

    *) die "unknown type $1" ;;
  esac
}

function _canonic()
{
  case "$1" in
    bool*)
      if echo "$2" | grep -qiE '^(y(es)?)$'; then
        echo y
      else
        echo n
      fi
      ;;
    *) echo "$2";;
  esac
}

function _save()
{
  local name="$1"
  local escaped_value=$(printf %q "$2")
  local comment="$( echo "$3"; echo ": $4" )"

  if [ -n "$comment" ]; then
    echo "$comment" | sed -e 's/^/# /' >> "$TMPOUT"
  fi
  echo $name=$escaped_value >> "$TMPOUT"
  echo >> "$TMPOUT"

  eval $name=$escaped_value
}

function ask()
{
  [ -n "$TMPOUT" ] || raise "seems like you forgot to call init"

  usage="ask TYPE NAME PROMPT [DEFAULT]"
  [ -n "$1" ] || raise $usage
  local kind="$1"; shift

  [ -n "$1" ] || raise $usage
  local name="$1"; shift

  [ -n "$1" ] || raise $usage
  local prompt="$1"; shift


  echo

  if [ -n "$DESC" ]; then
    bold
    blue "$DESC"
  fi

  local default="$1"
  local current=$(value "$name")

  local a
  while true; do

    # use the previously selected value as the default when re-configuring
    if [ -n "$current" ]; then
      local v="$current"
      unset current
    else
      local v="$default"
      unset default
    fi

    _prompt "$prompt" "$v"

    yellow
    if [ -z "$ASK_FORCE" -a -n "$v" ]; then
      # try to use currently active default
      a="$v"
      echo "$a"

    else
      read a
      [ -z "$a" ] && a="$v"
    fi
    nc

    if _validate "$kind" "$a"; then
      local canonic="$(_canonic "$kind" "$a")"
      echo -n "> "
      red "$canonic"
      _save "$name" "$canonic" "$DESC" "$prompt"
      break
    else
      yellow -e "'$a' ${READ}is not a valid '${kind}'"
    fi
  done

  DESC=
}
