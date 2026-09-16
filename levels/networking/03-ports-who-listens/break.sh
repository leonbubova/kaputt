source ../../../lib/common.sh; source ../lib.sh
X pkill -f 'nc -lk' >/dev/null 2>&1 || true
XD sh -c 'nc -lk 4321'; sleep 1
