source ../../../lib/common.sh; source ../lib.sh
want=$(Rcfg maxclients)
[ "$(R GET audit:maxclients)" = "$want" ] || fail "audit:maxclients is '$(R GET audit:maxclients)', server runs with $want"
ok "audit:maxclients matches the live setting"
