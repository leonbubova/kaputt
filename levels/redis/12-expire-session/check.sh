source ../../../lib/common.sh; source ../lib.sh
[ "$(R GET session:abc)" = token123 ] || fail "session:abc is not token123"
ttl=$(R TTL session:abc)
[ "$ttl" -ge 1 ] 2>/dev/null && [ "$ttl" -le 3600 ] 2>/dev/null || fail "session:abc TTL is $ttl (want 1..3600)"
ok "session:abc set with a TTL"
