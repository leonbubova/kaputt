source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
want=$(X grep -c '" 500 ' /var/log/app/access.log 2>/dev/null)
a=$(X cat /answer 2>/dev/null | tr -d '[:space:]'); [ "$a" = "$want" ] || fail "/answer is '${a:-empty}' (want $want)"
ok "counted"
