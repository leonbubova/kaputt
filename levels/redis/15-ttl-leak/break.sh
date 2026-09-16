source ../../../lib/common.sh; source ../lib.sh
R DEL session:a session:b session:c >/dev/null
R SET session:a tok-a EX 3600 >/dev/null; R SET session:b tok-b >/dev/null; R SET session:c tok-c EX 3600 >/dev/null
