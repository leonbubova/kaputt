source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
[ -f "$APP/out/dev.txt" ] && [ -f "$APP/out/prod.txt" ] || fail "expected out/dev.txt and out/prod.txt"
ok "for_each over a set works"
