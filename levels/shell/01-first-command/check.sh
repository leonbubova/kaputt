source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
have hello.txt || fail "no hello.txt in the sandbox yet — type the command from the task and press Enter"
[ "$(word_in hello.txt)" = hello ] || fail "hello.txt exists but contains '$(cat "$WORK/hello.txt")' — it should contain just: hello"
ok "hello.txt says hello — your first command worked"
