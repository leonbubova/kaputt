source ../../../lib/common.sh; source ../lib.sh
X nginx -t >/dev/null 2>&1 || fail "nginx -t still fails"
inurl localhost:8080 | grep -q 'api ok' || fail "8080 does not return 'api ok'"
ok "config valid, API up on 8080"
