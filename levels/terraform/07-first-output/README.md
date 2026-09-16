# outputs — reading a value back
Lesson: an `output` block tells terraform to print a value after apply, and to keep it so scripts can ask for it later.
The value usually points at a resource: `<type>.<name>.<attribute>` — for example `local_file.note.filename` is the
`filename` of the resource block named `note`. Any argument you wrote in the block can be read back this way.
    output "note_path" {
      value = local_file.note.filename
    }
After apply, terraform prints `Outputs:` with `note_path = "./out/note.txt"`. One output alone, without quotes:
    terraform output -raw note_path
This level is already applied with one resource, `local_file.note` (`out/note.txt`). `main.tf` has no output yet.
Try it:
    wg shell
    cat main.tf
    terraform output
Your task: add the `output "note_path"` block shown above to the end of `main.tf` (a new block, below the resource). Save,
`terraform apply -auto-approve`, then `terraform output -raw note_path` must print `./out/note.txt`.
File: ~/.k8s-wargame/terraform/app/main.tf — open it in any editor (VS Code: `code ~/.k8s-wargame/terraform/app`). Commands: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
