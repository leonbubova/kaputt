source ../../../lib/common.sh; source ../lib.sh
R DEL inbox demo:q >/dev/null; R RPUSH inbox mail1 mail2 mail3 >/dev/null
