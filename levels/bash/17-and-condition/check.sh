source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have batchok.sh || fail "no batchok.sh in the sandbox"
t(){ out=$(run batchok.sh "$1"); [ "$out" = "$2" ] || fail "batchok.sh $1 → '$out', want $2"; }
t 8 yes
t 2 yes
t 3 no
t 0 no
t -4 no
ok "batchok.sh requires both conditions"
