source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
resource "local_file" "app" {
  filename = "${path.module}/out/a.txt"
  content  = "a\n"
}
resource "local_file" "app" {
  filename = "${path.module}/out/b.txt"
  content  = "b\n"
}
T
