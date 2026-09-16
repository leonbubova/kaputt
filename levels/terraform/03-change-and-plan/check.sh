source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app
[ -f "$APP/out/note.txt" ] || fail "out/note.txt is gone — terraform apply -auto-approve recreates it"
grep -qx 'a better note' "$APP/out/note.txt" || fail "out/note.txt still says: $(cat "$APP/out/note.txt") — change content in main.tf, then apply"
plan_clean || fail "out/note.txt has the new text but terraform plan still wants changes — edit main.tf (not the file in out/) and apply"
ok "content changed in main.tf and applied — plan is clean again"
