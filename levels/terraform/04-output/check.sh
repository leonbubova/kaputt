source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
v=$(outraw file_content) || fail "no output named file_content"
[ "$v" = "hello, world" ] || fail "output file_content = '$v', want 'hello, world'"
ok "output file_content exposes the content"
