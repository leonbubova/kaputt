source ../../../lib/common.sh; source ../lib.sh
R DEL thing:a thing:b thing:c answer:list >/dev/null
R SET thing:a plain >/dev/null; R HSET thing:b k v >/dev/null; R RPUSH thing:c one two >/dev/null
