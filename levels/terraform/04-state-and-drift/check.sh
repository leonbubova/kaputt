source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app
[ -f "$APP/out/todo.txt" ] || fail "out/todo.txt is still missing — terraform plan shows it as '+ create'; terraform apply -auto-approve makes it"
grep -qx 'buy milk' "$APP/out/todo.txt" || fail "out/todo.txt contains: $(cat "$APP/out/todo.txt") — expected: buy milk (let terraform write it)"
in_state 'local_file.todo' || fail "local_file.todo is not in the state — apply did not run"
plan_clean || fail "the file is there but terraform plan still wants changes — it was not written by terraform apply"
ok "drift repaired — state, description and reality agree again"
