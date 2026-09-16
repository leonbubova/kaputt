source ../../../lib/common.sh; source ../lib.sh
inurl http://api.internal:8080 | grep -q 'api ok' || fail "api.internal:8080 does not reach the local API"
ok "api.internal points at the API"
