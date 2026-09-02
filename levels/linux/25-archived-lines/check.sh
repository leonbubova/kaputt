source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X test -f /var/log/app/access.log.3.gz 2>/dev/null || fail "access.log.3.gz is gone"
X gzip -t /var/log/app/access.log.3.gz 2>/dev/null || fail "access.log.3.gz is no longer a gzip archive"
want=$(X zcat /var/log/app/access.log.3.gz 2>/dev/null | wc -l | tr -d ' ')
a=$(X cat /answer 2>/dev/null | tr -d '[:space:]'); [ "$a" = "$want" ] || fail "/answer is '${a:-empty}' (want $want)"
ok "counted without unpacking"
