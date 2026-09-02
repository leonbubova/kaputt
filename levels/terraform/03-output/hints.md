## 1
An `output "name" { value = ... }` block exposes a value after apply.
## 2
Reference the resource attribute: `local_file.hello.content`. Wrap in `trimspace(...)` to drop the trailing newline.
## 3
    output "file_content" { value = trimspace(local_file.hello.content) }
