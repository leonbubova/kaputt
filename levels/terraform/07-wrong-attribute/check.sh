source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
p=$(outraw pet) || fail "no output named pet"
[ -n "$p" ] || fail "output pet empty"
grep -qx "$p" "$APP/out/name.txt" || fail "out/name.txt != pet"
ok "attribute reference fixed"
