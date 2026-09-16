source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
resource "local_file" "node" {
  count    = 3
  filename = "${path.module}/out/node-${count.index}.txt"
  content  = "node ${count.index}\n"
}
T
