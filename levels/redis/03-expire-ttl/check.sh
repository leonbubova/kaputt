source ../../../lib/common.sh; source ../lib.sh
[ "$(R EXISTS note:temp)" = 1 ] || fail "no key note:temp yet — SET note:temp bye, then give it a TTL"
[ "$(R GET note:temp)" = bye ] || fail "note:temp holds '$(R GET note:temp)' — it should hold exactly: bye"
ttl=$(R TTL note:temp)
[ "$ttl" = -1 ] && fail "note:temp has no expiry (TTL -1) — EXPIRE note:temp 600"
[ "$ttl" -ge 1 ] 2>/dev/null && [ "$ttl" -le 3600 ] || fail "TTL is $ttl — wanted between 1 and 3600 seconds"
ok "note:temp holds bye and expires in ${ttl}s"
