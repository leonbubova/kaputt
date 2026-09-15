source ../../../lib/common.sh; source ../lib.sh
[ "$(R EXISTS session:b)" = 0 ] || fail "session:b (no expiry) still exists"
for k in session:a session:c; do
  [ "$(R GET $k)" = "tok-${k#session:}" ] || fail "$k was changed or deleted"
  ttl=$(R TTL $k); [ "$ttl" -ge 1 ] 2>/dev/null || fail "$k lost its expiry (TTL $ttl)"
done
ok "the non-expiring session is gone, the others are intact"
