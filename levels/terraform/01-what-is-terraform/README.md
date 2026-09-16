# what terraform is — and `terraform init`
Lesson: terraform is a program that builds things from a description. You write, in a text file ending in `.tf`, what
should exist (a file, a server, a database — in this game: only files on your disk). Terraform compares that with what
really exists and does whatever is missing. You never say "do this, then that" — you say "this is how it should look"
and terraform works out the steps. The description is called the configuration; the "how it should look" is the desired state.
Before terraform can work in a folder it needs its helpers, called providers (the `local` provider knows how to create
files). Fetching them is `terraform init` — once per folder, and this game gives you a fresh folder every level.
Try it:
    wg shell
    ls
    cat versions.tf
`versions.tf` lists the providers this folder uses. There is nothing else yet.
Your task: run `terraform init` inside ~/.k8s-wargame/terraform/app. It ends with "Terraform has been successfully initialized!"
and creates a hidden folder `.terraform` plus a file `.terraform.lock.hcl` — see them with `ls -a`.
Work in ~/.k8s-wargame/terraform/app — `wg shell` drops you there with terraform ready (type `exit` to come back; `wg check` works inside too).
Check yourself:  wg check      stuck?  wg hint
