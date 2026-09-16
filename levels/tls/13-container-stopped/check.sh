source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(bodyk $URL/)" = "tls ok" ] || fail "wg-tls runs but HTTPS does not answer"
ok "wg-tls is back up"
