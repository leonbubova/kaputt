source ../../../lib/common.sh; source ../lib.sh
[ "$(R GET session:live)" = tok-live ] || fail "session:live value changed"
ttl=$(R TTL session:live)
[ "$ttl" -ge 1 ] 2>/dev/null && [ "$ttl" -le 3600 ] 2>/dev/null || fail "session:live TTL is $ttl (want 1..3600)"
ok "session:live now expires"
