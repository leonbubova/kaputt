source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X curl -s --max-time 4 http://api.internal:9100/ 2>/dev/null | grep -q "api ok" || fail "api.internal:9100 does not answer"
ok "api.internal reachable"
