source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
verify_host || fail "certificate does not validate for shop.local (wrong cert served?)"
ok "correct certificate served for shop.local"
