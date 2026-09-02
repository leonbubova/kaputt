# a resource block declares a thing; apply makes it exist
Lesson: terraform does not run commands. You write down what should exist, and `terraform apply` compares that description with what it already knows (the state file) and creates, changes, or deletes until reality matches. You describe the end state, never the steps.
The unit of description is a `resource` block: a type (what kind of thing, provided by a provider), a name you choose (how the config refers to it), and arguments inside the braces. A file on disk is a resource like any other — the `local` provider offers `local_file`.
Any `.tf` file in the directory is read; a new `main.tf` next to `versions.tf` is the usual place. `${path.module}` is the directory the config lives in, so paths stay correct wherever it is run from.
    resource "local_file" "x" { filename = "${path.module}/out/x.txt"  content = "text\n" }    type + your name + arguments
    terraform init                          fetch providers once — required before the first plan/apply
    terraform apply -auto-approve           make reality match the .tf files
    terraform state list                    what terraform now believes exists
Try it first: `terraform init` in the play area, then `terraform state list` — empty, because nothing is declared yet.
Your task: bootstrap the play area. Write a `local_file` resource that creates `out/hello.txt` containing exactly `hello, terraform`. `terraform apply` should produce the file.
Goal: after apply, `out/hello.txt` exists and its single line is `hello, terraform`.
Check yourself:  wg check      stuck?  wg hint
