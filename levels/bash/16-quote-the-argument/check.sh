source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have catf.sh || fail "no catf.sh in the sandbox"
out=$(run catf.sh "my notes.txt"); c=$(run_code)
[ "$out" = secret ] && [ "$c" = 0 ] || fail "catf.sh 'my notes.txt' → '$out' (exit $c), want 'secret'"
ok "catf.sh handles filenames with spaces"
