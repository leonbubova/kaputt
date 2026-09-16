## 1
An output is a block like resource, with one argument: `value`. The value refers to the resource by type, then your name, then the attribute — with dots between.
## 2
Add below the resource in main.tf: `output "note_path" { value = local_file.note.filename }`. Outputs only appear after an apply.
## 3
    output "note_path" {
      value = local_file.note.filename
    }
then
    terraform apply -auto-approve
    terraform output -raw note_path
