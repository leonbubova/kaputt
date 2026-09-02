# machine-applied solutions, one per level — used by run-all.sh only. Writes the fixed config.
source "$(dirname "${BASH_SOURCE[0]}")/tflib.sh"

# the good versions.tf (template default: local, random, null)
tf_versions() { wf versions.tf <<'T'
terraform {
  required_version = ">= 1.5"
  required_providers {
    local  = { source = "hashicorp/local", version = "~> 2.5" }
    random = { source = "hashicorp/random", version = "~> 3.6" }
    null   = { source = "hashicorp/null", version = "~> 3.2" }
  }
}
T
}

s01(){ wf main.tf <<'T'
resource "local_file" "hello" {
  filename = "${path.module}/out/hello.txt"
  content  = "hello, terraform\n"
}
T
}

s02(){ wf main.tf <<'T'
variable "greeting" {
  type    = string
  default = "hi"
}
resource "local_file" "greet" {
  filename = "${path.module}/out/greet.txt"
  content  = "${var.greeting}, world\n"
}
T
}

s03(){ wf main.tf <<'T'
resource "local_file" "hello" {
  filename = "${path.module}/out/hello.txt"
  content  = "hello, world\n"
}
output "file_content" {
  value = trimspace(local_file.hello.content)
}
T
}

s04(){ wf main.tf <<'T'
resource "random_pet" "n" {
  length = 2
}
resource "local_file" "name" {
  filename = "${path.module}/out/name.txt"
  content  = random_pet.n.id
}
output "pet" {
  value = random_pet.n.id
}
T
}

s05(){ wf main.tf <<'T'
resource "local_file" "node" {
  count    = 3
  filename = "${path.module}/out/node-${count.index}.txt"
  content  = "node ${count.index}\n"
}
T
}

s06(){ tf_versions; wf main.tf <<'T'
resource "random_pet" "p" {
  length = 2
}
resource "local_file" "name" {
  filename = "${path.module}/out/name.txt"
  content  = random_pet.p.id
}
T
}

s07(){ wf main.tf <<'T'
resource "random_pet" "n" {
  length = 2
}
resource "local_file" "name" {
  filename = "${path.module}/out/name.txt"
  content  = random_pet.n.id
}
output "pet" {
  value = random_pet.n.id
}
T
}

s08(){ wf main.tf <<'T'
resource "local_file" "node" {
  count    = 2
  filename = "${path.module}/out/n-${count.index}.txt"
  content  = "n\n"
}
output "first" {
  value = local_file.node[0].filename
}
T
}

s09(){ wf main.tf <<'T'
variable "envs" {
  type    = list(string)
  default = ["dev", "prod"]
}
resource "local_file" "env" {
  for_each = toset(var.envs)
  filename = "${path.module}/out/${each.key}.txt"
  content  = "${each.key}\n"
}
T
}

s10(){ wf main.tf <<'T'
resource "local_file" "app" {
  filename = "${path.module}/out/a.txt"
  content  = "a\n"
}
resource "local_file" "app2" {
  filename = "${path.module}/out/b.txt"
  content  = "b\n"
}
T
}

s11(){ wf main.tf <<'T'
variable "port" {
  type    = number
  default = 8080
}
resource "local_file" "cfg" {
  filename = "${path.module}/out/cfg.txt"
  content  = "port=${var.port}\n"
}
T
}

s12(){ tf_versions; wf main.tf <<'T'
resource "random_pet" "p" {
  length = 2
}
resource "local_file" "name" {
  filename = "${path.module}/out/name.txt"
  content  = random_pet.p.id
}
output "pet" {
  value = random_pet.p.id
}
T
}
