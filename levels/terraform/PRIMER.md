# terraform — the commands you'll actually use
Play area: ~/.k8s-wargame/terraform/app (`wg shell`). Providers local/random/null come from an offline mirror; files you create land in out/.

  terraform init                          fetch/verify providers — fails on an impossible version constraint
  terraform validate  /  terraform fmt    syntax + reference check without touching state / tidy formatting
  terraform plan                          what WOULD change; the error names file:line and the attribute
  terraform apply -auto-approve           do it (-var name=value overrides a variable)
  terraform output -raw name              read one output back (what CI does)
  terraform state list                    what terraform thinks exists
  resource "local_file" "hello" { filename = "${path.module}/out/hello.txt"  content = "…\n" }    a resource = type + YOUR name + arguments; two blocks can't share type+name
  variable "x" { type = string  default = "hi" }  →  var.x        no default = required = unattended apply dies
  output "x" { value = local_file.hello.content }               reference = <type>.<name>.<attribute>  (random_pet → .id, not .name)
  count = 3 → count.index, local_file.node[0]   ·   for_each = toset(var.list) → each.key    many instances from one block
  required_providers { random = { source = "hashicorp/random", version = "~> 3.6" } }    versions.tf

Mental model: terraform diffs your .tf declarations against the state file and makes reality match — you describe the end state, never the steps. Errors come in order: init (providers/versions) → plan (syntax, duplicate names, unknown attributes, count/for_each shapes) → apply (real-world failures). Fix the earliest one first; the message always names the block.
