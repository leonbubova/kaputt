source ../../../lib/common.sh; source ../lib.sh
grep -q 'ssl_protocols ' "$CONF" || fail "the ssl_protocols line is gone — fix it, don't delete it"
running; conf_ok
[ "$(bodyk $URL/)" = "tls ok" ] || fail "HTTPS not serving"
ok "config parses again, site up"
