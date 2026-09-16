source ../../../lib/common.sh; source ../lib.sh
[ "$(R GET app:name)" = shop ] || fail "app:name is not 'shop'"
ok "app:name = shop"
