source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
grep -q 'location /shop/' "$CONF" || fail "default.conf has no 'location /shop/' block yet"
[ "$(code $URL/shop/orders)" = 200 ] || fail "/shop/orders does not return 200 (got $(code $URL/shop/orders)) — reloaded?"
body $URL/shop/orders | grep -q 'orders=\[\]' || fail "/shop/orders answers '$(body $URL/shop/orders | head -c 40)', expected 'orders=[]' — proxy_pass target must be http://wg-backend:9000/ with the trailing slash"
ok "/shop/orders comes from the backend — nginx handed the request on"
