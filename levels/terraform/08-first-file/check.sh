source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
[ -f "$APP/out/hello.txt" ] || fail "out/hello.txt was not created"
grep -qx 'hello, terraform' "$APP/out/hello.txt" || fail "out/hello.txt content is: $(cat "$APP/out/hello.txt")"
in_state 'local_file.hello' || fail "local_file.hello not in state"
ok "local_file.hello writes out/hello.txt"
