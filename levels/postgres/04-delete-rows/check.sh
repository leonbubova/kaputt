source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table users || fail "users table is gone — delete rows, not the table"
[ "$(sql "select count(*) from users where role = 'tester'")" = 0 ] || fail "tester accounts still in users"
n=$(sql "select count(*) from users"); [ "$n" = 4 ] || fail "want the 4 real users, got $n"
got=$(sql "select email from users order by email"); want=$(printf 'anna@example.com\nben@example.com\ncara@example.com\ndan@example.com')
[ "$got" = "$want" ] || fail "real users changed:
$got"
ok "test accounts gone, real users intact"
