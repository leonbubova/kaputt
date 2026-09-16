source ../../../lib/common.sh; source ../lib.sh
R DEL color:one color:two color:old >/dev/null
R SET color:one red >/dev/null; R SET color:two blue >/dev/null; R SET color:old gray >/dev/null
