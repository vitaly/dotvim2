NC='\033[0m'

BOLD='\033[1m'

BLACK='\033[30m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'

BG_RED='\033[41m'
BG_YELLOW='\033[43m'

function nc()      { echo -en $NC; }

function with_color()
{
  echo -en $1; shift
  [ -z "$*" ] && return

  echo "$@"; nc
}

function bold()    { with_color $BOLD "$@" ; }

function black()   { with_color $BLACK "$@" ; }
function red()     { with_color $RED "$@" ; }
function green()   { with_color $GREEN "$@" ; }
function yellow()  { with_color $YELLOW "$@" ; }
function blue()    { with_color $BLUE "$@" ; }
function magenta() { with_color $MAGENTA "$@" ; }
function cyan()    { with_color $CYAN "$@" ; }
function white()   { with_color $WHITE "$@" ; }
