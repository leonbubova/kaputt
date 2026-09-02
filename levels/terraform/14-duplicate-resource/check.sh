source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
[ -f "$APP/out/a.txt" ] && [ -f "$APP/out/b.txt" ] || fail "expected out/a.txt and out/b.txt"
ok "resource names are unique"
