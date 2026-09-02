source ../../../lib/common.sh; source ../lib.sh
[ "$(R GET catalog)" = "keyboard,mouse,monitor" ] || fail "catalog does not hold the catalog data"
ok "catalog is readable under the right key"
