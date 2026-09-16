source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table pets || fail "the pets table is gone"
[ "$(sql "select count(*) from pets")" = 7 ] || fail "the table should still have exactly 7 pets (wg reset gives you a fresh one)"
a=$(sql "select age from pets where name = 'Bella'"); [ "$a" = 6 ] || fail "Bella's age is $a, should be 6 — update pets set age = … where …;"
others=$(sql "select name || ':' || species || ':' || age from pets where name <> 'Bella' order by id")
want=$(printf 'Rex:dog:3\nMilo:cat:5\nNala:cat:7\nCoco:parrot:12\nSimba:cat:1\nDaisy:rabbit:4')
[ "$others" = "$want" ] || fail "other pets changed too — did the UPDATE have a WHERE? (wg reset, then try again)
$others"
ok "Bella is 6, everyone else untouched — you changed one row with UPDATE … WHERE"
