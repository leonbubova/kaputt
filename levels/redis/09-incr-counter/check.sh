source ../../../lib/common.sh; source ../lib.sh
[ "$(R GET deploy:count)" = 42 ] || fail "deploy:count is $(R GET deploy:count), want 42 (one more than before)"
ok "deploy:count bumped by one"
