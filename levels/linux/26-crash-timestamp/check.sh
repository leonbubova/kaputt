source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
a=$(X cat /answer 2>/dev/null | tr -d '[:space:]'); [ "$a" = "2026-08-30T02:17:43Z" ] || fail "/answer is '${a:-empty}'"
ok "timestamp found"
