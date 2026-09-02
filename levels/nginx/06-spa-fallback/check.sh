source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/dashboard)" = 200 ] || fail "/dashboard returns $(code $URL/dashboard), not 200"
body $URL/dashboard | grep -q 'Welcome to shop.local' || fail "/dashboard did not fall back to index.html"
ok "deep links fall back to index.html"
