source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
resource "local_file" "note" {
  filename = "${path.module}/out/note.txt"
  content  = "a note\n"
}
T
tfinit; tfq apply -auto-approve -input=false
