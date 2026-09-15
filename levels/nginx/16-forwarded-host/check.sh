source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
h=$(body $URL/api/whoami | awk -F= '/^host=/{print $2}')
[ "$h" = shop.local ] || fail "backend sees host '$h', expected shop.local"
ok "original Host forwarded to the backend"
