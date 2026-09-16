source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table pets || fail "the pets table is gone"
n=$(sql "select count(*) from pets where name = 'Luna'")
[ "$n" -ge 1 ] || fail "no pet named Luna yet — insert into pets (name, species, age) values (…);"
[ "$n" = 1 ] || fail "Luna is in there $n times — she should be one row (delete comes later; wg reset gives you a fresh table)"
[ "$(sql "select species || '/' || age from pets where name = 'Luna'")" = "cat/2" ] || fail "Luna exists but species/age are '$(sql "select species || '/' || age from pets where name = 'Luna'")' — wanted cat and 2"
[ "$(sql "select count(*) from pets where id <= 7")" = 7 ] || fail "one of the 7 original pets is gone"
ok "Luna is a pet — you added a row with INSERT"
