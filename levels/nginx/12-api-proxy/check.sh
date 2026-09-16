source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
body $URL/api/orders | grep -q 'orders=\[\]' || fail "/api/orders does not reach the backend"
body $URL/api/ | grep -q 'backend ok' || fail "/api/ does not reach the backend root"
ok "/api/ proxies to the backend"
