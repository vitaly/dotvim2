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

function nc()      { echo -en $NC;      }

function bold()    { echo -en $BOLD;    }

function black()   { echo -en $BLACK;   }
function red()     { echo -en $RED;     }
function green()   { echo -en $GREEN;   }
function yellow()  { echo -en $YELLOW;  }
function blue()    { echo -en $BLUE;    }
function magenta() { echo -en $MAGENTA; }
function cyan()    { echo -en $CYAN;    }
function white()   { echo -en $WHITE;   }

BG_RED='\033[41m'
BG_YELLOW='\033[43m'
