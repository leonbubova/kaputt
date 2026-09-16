source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
grep -qx 'hi, world' "$APP/out/greet.txt" 2>/dev/null || fail "default greet.txt is: $(cat "$APP/out/greet.txt" 2>/dev/null)"
o=$(tf apply -auto-approve -input=false -var=greeting=yo) || { tail_err "$o"; fail "apply with -var greeting=yo failed"; }
grep -qx 'yo, world' "$APP/out/greet.txt" 2>/dev/null || fail "-var did not change the output (greeting is not a variable?): $(cat "$APP/out/greet.txt" 2>/dev/null)"
ok "greeting is a variable defaulting to hi"
