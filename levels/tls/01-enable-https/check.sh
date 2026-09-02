source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(bodyk $URL/)" = "tls ok" ] || fail "HTTPS on 9443 does not return 'tls ok'"
ok "HTTPS is serving on 443"
