source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ -s "$QUERY" ] || fail "no query yet in ~/.k8s-wargame/postgres/query.sql — test it in psql, then echo it into that file"
got=$(sqlq 2>&1) || fail "query.sql fails when psql runs it:
$got
(did the ; make it into the file? are the single quotes around cat still there?)"
want=$(printf 'Milo\nNala\nSimba'); gots=$(printf '%s' "$got" | sort)
[ "$gots" = "$want" ] || fail "want exactly the names of the 3 cats (Milo, Nala, Simba), one column. got:
$got"
ok "query.sql returns the cats — you filtered rows with WHERE"
