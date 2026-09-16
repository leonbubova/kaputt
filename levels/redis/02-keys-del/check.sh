source ../../../lib/common.sh; source ../lib.sh
[ "$(R EXISTS color:old)" = 0 ] || fail "color:old still exists — remove it with DEL color:old"
[ "$(R GET color:one)" = red ] || fail "color:one was changed or deleted — only color:old should go (wg reset to start over)"
[ "$(R GET color:two)" = blue ] || fail "color:two was changed or deleted — only color:old should go (wg reset to start over)"
ok "color:old is gone, color:one and color:two are untouched"
