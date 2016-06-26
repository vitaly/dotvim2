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
ENUM=
function enum()
{
  ENUM="$*"
}

function _prompt()
{
  green -n "${1}"
  [ -n "$2" ] && cyan -n " [$2]"
  green -n ": "
}

# _validate KIND VALUE
function _validate()
{
  case "$1" in
    bool*) echo "$2" | grep -qiE '^(y(es)?|no?)$' ;;
    num*)  echo "$2" | grep -qiE '^[0-9]+$' ;;
    word)  echo "$2" | grep -qiE '^[a-z]+$' ;;
    sym*)   echo "$2" | grep -qiE '^[a-z0-9_]+$' ;;
    simple) echo "$2" | grep -qiE '^[a-z0-9_ ]+$' ;;
    enum) echo "$2" | grep -qE "$ENUM";;
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

    # in case of non-forced config, we can re-use the current value 'ONCE!' if
    # it fails (e.g. invalid) we should ignore it on the next iteration
    #
    # in case of forced config, we should use the currently set value as a
    # default, i.e. the value that will be used for simple 'ENTER' but we also
    # want to choose it only once, and if its invalid, on the next run we want
    # to preset the global default instead (but also only once

    yellow

    if [ -z "$ASK_FORCE" -a -n "$current" ]; then
      _prompt "$prompt" "$current"
      a="$current"; unset current
      echo "$a"

    else
      if [ -n "$current" ]; then
        v="$current"
      else
        if [ -n "$default" ]; then
          v="$default"
        else
          v=
        fi
      fi

      _prompt "$prompt" "$v"
      read a

      if [ -z "$a" ]; then
        a="$v"
        if [ -n "$current" ]; then
          unset current
        else
          unset default
        fi
      fi
    fi
    nc

    if _validate "$kind" "$a"; then
      local canonic="$(_canonic "$kind" "$a")"
      _save "$name" "$canonic" "$DESC" "$prompt"
      break
    else
      yellow -e "'$a' ${READ}is not a valid '${kind}'"
    fi
  done

  DESC=
  ENUM=
}
