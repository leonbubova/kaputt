source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
variable "envs" {
  type    = list(string)
  default = ["dev", "prod"]
}
resource "local_file" "env" {
  for_each = var.envs
  filename = "${path.module}/out/${each.key}.txt"
  content  = "${each.key}\n"
}
T
