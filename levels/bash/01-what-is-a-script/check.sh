source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
have hello.sh || fail "no hello.sh in ~/.k8s-wargame/bash/work yet — create the file there"
out=$(run hello.sh 2>&1); [ "$out" = "hello from a script" ] || fail "bash hello.sh printed '$out' — it should print exactly: hello from a script"
ok "hello.sh runs — your first script"
