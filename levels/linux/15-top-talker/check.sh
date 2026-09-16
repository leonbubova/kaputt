source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
want=$(XS "awk '{print \$1}' /var/log/app/access.log | sort | uniq -c | sort -rn | head -1 | awk '{print \$2}'" 2>/dev/null)
a=$(X cat /answer 2>/dev/null | tr -d '[:space:]'); [ "$a" = "$want" ] || fail "/answer is '${a:-empty}' (want $want)"
ok "top talker found"
