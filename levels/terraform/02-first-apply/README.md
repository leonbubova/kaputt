# one resource, one apply
Lesson: a thing terraform should create is a resource. Open `main.tf` — it holds one resource block:
    resource "local_file" "note" {
      filename = "${path.module}/out/note.txt"
      content  = "a note\n"
    }
`local_file` is the type (a file on disk, from the `local` provider). `note` is a name YOU pick, so you can refer to this
block later. Inside the braces are the arguments: `filename` (where; `${path.module}` means "this folder") and `content`.
`terraform apply` makes it real. It first shows what it will do (`+ create`) and asks for a yes — `-auto-approve` says yes for you.
Afterwards two new things exist: the file in `out/`, and `terraform.tfstate` — terraform's memory of what it created.
Try it:
    wg shell
    cat main.tf
    terraform init
Your task: run `terraform apply -auto-approve`. Then `cat out/note.txt` shows `a note`, and `ls` shows `terraform.tfstate`.
Work in ~/.k8s-wargame/terraform/app — `wg shell` drops you there with terraform ready (type `exit` to come back; `wg check` works inside too).
Check yourself:  wg check      stuck?  wg hint
