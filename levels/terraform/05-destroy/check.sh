source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app
[ -f "$APP/terraform.tfstate" ] || fail "terraform.tfstate was deleted — destroy empties it, it does not remove it. wg reset and use terraform destroy"
[ ! -e "$APP/out/note.txt" ] && [ ! -e "$APP/out/todo.txt" ] || fail "files still in out/: $(ls "$APP/out" | tr '\n' ' ')— run: terraform destroy -auto-approve"
if in_state 'local_file.note' || in_state 'local_file.todo'; then fail "the files are gone but terraform still has them in state — they were removed by hand, not by destroy"; fi
ok "destroyed — state is empty, main.tf still describes the files for the next apply"
