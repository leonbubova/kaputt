source ../../../lib/common.sh; source ../lib.sh
inurl localhost:8080 | grep -q 'api ok' || fail "8080 still unreachable — check the port AND the firewall"
ok "both faults fixed, API on 8080"
