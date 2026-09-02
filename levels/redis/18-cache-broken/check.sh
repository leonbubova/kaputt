source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt cache:home)" = string ] || fail "cache:home is not a string (type: $(Rt cache:home))"
[ "$(R GET cache:home)" = "<html>home</html>" ] || fail "cache:home value is wrong"
ttl=$(R TTL cache:home)
[ "$ttl" -ge 1 ] 2>/dev/null && [ "$ttl" -le 600 ] 2>/dev/null || fail "cache:home TTL is $ttl (want 1..600)"
ok "cache:home is a string with a TTL"
