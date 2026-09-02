source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
a=$(X cat /answer 2>/dev/null | tr -d '[:space:]'); [ "$a" = /var/lib/vendor/acme/.keys/license.key ] || fail "/answer is '${a:-empty}'"
ok "found it"
