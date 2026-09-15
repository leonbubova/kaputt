source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have between.sh || fail "no between.sh in the sandbox"
t(){ out=$(run between.sh $1 $2 $3); [ "$out" = "$4" ] || fail "between.sh $1 $2 $3 → '$out', want $4"; }
t 10 1 10 yes    # inclusive upper bound
t 1 1 10 yes     # inclusive lower bound
t 9 1 100 yes    # numeric, not lexical, ordering
t 5 1 10 yes
t 200 1 100 no
t 9 10 100 no
ok "between.sh is inclusive and numeric"
