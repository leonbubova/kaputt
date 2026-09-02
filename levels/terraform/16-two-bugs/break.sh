source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
wf versions.tf <<'T'
terraform {
  required_version = ">= 1.5"
  required_providers {
    local  = { source = "hashicorp/local", version = "~> 2.5" }
    random = { source = "hashicorp/random", version = "~> 99.0" }
    null   = { source = "hashicorp/null", version = "~> 3.2" }
  }
}
T
wf main.tf <<'T'
resource "random_pet" "p" {
  length = 2
}
resource "local_file" "name" {
  filename = "${path.module}/out/name.txt"
  content  = random_pet.p.name
}
output "pet" {
  value = random_pet.p.name
}
T
