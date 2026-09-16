source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
variable "port" {
  type = number
}
resource "local_file" "cfg" {
  filename = "${path.module}/out/cfg.txt"
  content  = "port=${var.port}\n"
}
T
