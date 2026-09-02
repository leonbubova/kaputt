source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
[ -s "$APP/out/name.txt" ] || fail "out/name.txt is empty or missing"
p=$(outraw pet) || fail "no output named pet"
[ -n "$p" ] || fail "output pet is empty"
grep -qx "$p" "$APP/out/name.txt" || fail "out/name.txt ($(cat "$APP/out/name.txt")) != output pet ($p)"
plan_clean || fail "a second plan is not empty — the name is not persisted in state"
ok "random_pet name is stable and exposed"
