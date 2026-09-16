Add an output that references the resource attribute, apply, read it back.
    output "note_path" { value = local_file.note.filename }
    terraform apply -auto-approve && terraform output -raw note_path
