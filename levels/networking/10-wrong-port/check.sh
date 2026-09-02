source ../../../lib/common.sh; source ../lib.sh
inurl localhost:8080 | grep -q 'api ok' || fail "nothing serving 'api ok' on 8080"
ok "API back on 8080"
