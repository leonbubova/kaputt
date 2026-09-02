source ../../../lib/common.sh; source ../lib.sh
[ "$(Rcfg appendonly)" = yes ] || fail "appendonly is $(Rcfg appendonly), want yes"
ok "AOF persistence enabled"
