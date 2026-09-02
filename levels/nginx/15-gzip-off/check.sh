source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
ce=$(curl -s -k -m 5 -H 'Host: shop.local' -H 'Accept-Encoding: gzip' -D - -o /dev/null $URL/app.js | tr -d '\r' | awk 'tolower($1)=="content-encoding:"{print $2}')
[ "$ce" = gzip ] || fail "app.js is not gzip-encoded (Content-Encoding: '$ce')"
ok "text assets are gzip-compressed"
