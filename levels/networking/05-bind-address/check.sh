source ../../../lib/common.sh; source ../lib.sh
ip=$(cip)
inurl "$ip:8080" | grep -q 'api ok' || fail "API not reachable on $ip:8080 (bound to loopback only?)"
ok "API reachable on the network address"
