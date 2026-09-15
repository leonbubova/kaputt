source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
curl -sk -D - -o /dev/null -m 5 $URL/ | tr -d '\r' | grep -qi '^Strict-Transport-Security:' || fail "no Strict-Transport-Security header on HTTPS"
ok "HSTS header present"
