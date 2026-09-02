source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(bodyk $URL/)" = "tls ok" ] || fail "HTTPS not serving"
ok "certificate path fixed, site up"
