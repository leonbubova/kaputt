source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
variable "color" {
  type    = string
  default = "blue"
}
resource "local_file" "color" {
  filename = "${path.module}/out/color.txt"
  content  = "${var.color}\n"
}
T
tfinit; tfq apply -auto-approve -input=false
