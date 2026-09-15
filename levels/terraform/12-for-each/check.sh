source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
grep -qx 'Europe' "$APP/out/eu.txt" 2>/dev/null || fail "out/eu.txt: $(cat "$APP/out/eu.txt" 2>/dev/null)"
grep -qx 'United States' "$APP/out/us.txt" 2>/dev/null || fail "out/us.txt: $(cat "$APP/out/us.txt" 2>/dev/null)"
in_state '["eu"]' && in_state '["us"]' || fail "expected for_each instances keyed eu/us in state:
$(tf state list | sed 's/^/    /')"
ok "for_each created one file per region"
