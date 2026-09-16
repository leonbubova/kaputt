source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf main.tf <<'T'
resource "random_pet" "n" {
  length = 2
}
resource "local_file" "name" {
  filename = "${path.module}/out/name.txt"
  content  = random_pet.n.name
}
output "pet" {
  value = random_pet.n.name
}
T
