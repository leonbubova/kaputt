source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
grep -qx 'HELLO' "$APP/out/shout.txt" 2>/dev/null || fail "default shout.txt is: $(cat "$APP/out/shout.txt" 2>/dev/null)"
o=$(tf apply -auto-approve -input=false -var=word=bye) || { tail_err "$o"; fail "apply with -var word=bye failed"; }
grep -qx 'BYE' "$APP/out/shout.txt" 2>/dev/null || fail "-var word=bye did not yield BYE (is the value computed from var.word?): $(cat "$APP/out/shout.txt" 2>/dev/null)"
ok "upper() transforms the variable"
