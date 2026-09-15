source ../../../lib/common.sh; source ../lib.sh
X pkill -f 'nc -lk 9090' >/dev/null 2>&1 || true
XD sh -c 'nc -lk 9090'; sleep 1
if XS 'nc -z -w2 127.0.0.1 9090' >/dev/null 2>&1; then
  X pkill -f 'nc -lk 9090' >/dev/null 2>&1; fail "a connection to 9090 still gets through"
fi
X pkill -f 'nc -lk 9090' >/dev/null 2>&1 || true
ok "inbound 9090 is blocked"
