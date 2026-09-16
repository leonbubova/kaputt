source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app
v=$(outraw note_path) || fail "no output named note_path yet — add the output block to main.tf, then terraform apply -auto-approve"
case "$v" in *out/note.txt) ;; *) fail "output note_path is '$v' — expected the filename of local_file.note (./out/note.txt)";; esac
grep -q 'local_file\.note\.filename' "$APP"/*.tf || fail "note_path must reference the resource: value = local_file.note.filename (not the typed-out path)"
plan_clean || fail "main.tf has the output but it is not applied yet — terraform apply -auto-approve"
ok "output note_path reads the filename back from local_file.note"
