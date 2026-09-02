source ../../../lib/common.sh; source ../lib.sh
ip=$(cip)
inurl localhost:8080 | grep -q 'api ok' || fail "localhost:8080 no longer returns 'api ok'"
inurl "$ip:8080" >/dev/null 2>&1 && fail "API still reachable on $ip:8080 — it should be loopback only"
ok "API bound to 127.0.0.1 only"
