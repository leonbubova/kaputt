source ../../../lib/common.sh; source ../lib.sh
R DEL audit:maxclients >/dev/null; R CONFIG SET maxclients 4321 >/dev/null
