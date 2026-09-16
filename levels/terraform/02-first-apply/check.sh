source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app
[ -f "$APP/out/note.txt" ] || fail "out/note.txt does not exist yet — run: terraform apply -auto-approve (after terraform init)"
grep -qx 'a note' "$APP/out/note.txt" || fail "out/note.txt contains: $(cat "$APP/out/note.txt") — expected: a note"
[ -f "$APP/terraform.tfstate" ] || fail "out/note.txt exists but terraform.tfstate does not — the file must be created by terraform apply, not by hand"
in_state 'local_file.note' || fail "local_file.note is not in terraform's state — apply did not create it"
ok "local_file.note applied — out/note.txt exists and terraform remembers it in terraform.tfstate"
