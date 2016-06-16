function info()  { echo -e "${BLUE}$@${NC}";   }
function warn()  { echo -e "${YELLOW}$@${NC}"; }
function error() { echo -e "${RED}$@${NC}";    }

function die() { error "$@"; exit 1; }

function raise() { echo -e "${YELLOW}${BASH_SOURCE[2]}:${BASH_LINENO[1]} ${RED}$@${NC}"; exit 1; }

function value() { eval "echo \$$1"; }

function is_true() { [ 'y' == $(value "$1") ]; }
