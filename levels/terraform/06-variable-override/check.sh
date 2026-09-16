source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app
[ -f "$APP/out/color.txt" ] || fail "out/color.txt is gone — terraform apply -auto-approve -var color=red"
grep -qx 'red' "$APP/out/color.txt" || fail "out/color.txt says: $(cat "$APP/out/color.txt") — expected: red (apply with -var color=red)"
(cd "$APP" && terraform -chdir="$APP" plan -detailed-exitcode -input=false -var=color=red >/dev/null 2>&1) || fail "the file says red but a plan with -var color=red still wants changes — the value must come through the variable via terraform apply"
if plan_clean; then fail "a plan WITHOUT -var wants no changes — the default in main.tf is no longer blue; keep the default, pass red with -var"; fi
ok "variable overridden on the command line — default blue kept, file says red"
