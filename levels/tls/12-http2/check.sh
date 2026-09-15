source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
v=$(curl -sk --http2 -o /dev/null -m 5 -w '%{http_version}' $URL/)
[ "$v" = 2 ] || fail "HTTPS negotiates HTTP/$v, not HTTP/2"
ok "HTTP/2 enabled over TLS"
