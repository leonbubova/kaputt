source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/api/orders)" = 200 ] || fail "/api/orders returns $(code $URL/api/orders), not 200"
body $URL/api/orders | grep -q 'orders=\[\]' || fail "/api/orders body wrong"
ok "/api/ reaches the backend again"
