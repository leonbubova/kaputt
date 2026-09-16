source ../../../lib/common.sh; source ../lib.sh
want=$(R INFO memory | tr -d '\r' | awk -F: '$1=="maxmemory"{print $2}')
[ "$(R EXISTS audit:maxmemory)" = 1 ] || fail "no key audit:maxmemory yet — read maxmemory: from INFO memory, then SET audit:maxmemory <number>"
[ "$(R GET audit:maxmemory)" = "$want" ] || fail "audit:maxmemory is '$(R GET audit:maxmemory)' — INFO memory says maxmemory:$want"
ok "audit:maxmemory = $want — read from INFO memory"
