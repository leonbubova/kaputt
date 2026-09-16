source ../../../lib/common.sh; source ../lib.sh
XS 'ss -ltn' | grep -q ':9090 ' && fail "9090 is still open"
inurl localhost:8080 | grep -q 'api ok' || fail "the API on 8080 must keep running"
ok "9090 closed, API untouched"
