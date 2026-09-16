source ../../../lib/common.sh; source ../lib.sh
inurl localhost:8080 | grep -q 'api ok' || fail "8080 still blocked by the firewall"
ok "inbound 8080 allowed"
