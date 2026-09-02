source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ "$(sql "select count(*) from pg_stat_activity where application_name = 'wg-api'")" -ge 1 ] || fail "the wg-api session is gone — only office-laptop was supposed to go"
[ "$(sql "select count(*) from pg_stat_activity where application_name = 'office-laptop'")" = 0 ] || fail "office-laptop is still connected"
ok "office-laptop disconnected, API still up"
