source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
resource "local_file" "node" {
  count    = 2
  filename = "${path.module}/out/n-${count.index}.txt"
  content  = "n\n"
}
output "first" {
  value = local_file.node.filename
}
T
