source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/api/orders)" = 200 ] || fail "/api/orders still failing ($(code $URL/api/orders))"
body $URL/api/orders | grep -q 'orders=\[\]' || fail "/api/orders body wrong"
[ "$(code $URL/dashboard)" = 200 ] || fail "/dashboard still 404 ($(code $URL/dashboard))"
body $URL/dashboard | grep -q 'Welcome to shop.local' || fail "/dashboard fallback missing"
ok "API and deep links both fixed"
