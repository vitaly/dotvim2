function info()  { blue "$@";   }
function warn()  { yellow "$@"; }
function error() { red $@;      }

function die() { error "$@"; exit 1; }

function raise() { yellow -n "${BASH_SOURCE[2]}:${BASH_LINENO[1]}"; red " $@"; exit 1; }

function value() { eval "echo \$$1"; }

function is_true() { [ 'y' == $(value "$1") ]; }

function ask_bool()
{
  ask bool "$@"
  is_true $1
}
