## 1
The file in `out/` is the result, not the source. Change the `content = "..."` line in `main.tf`; terraform then replaces the file on the next apply.
## 2
After saving, `terraform plan` shows `-/+ resource "local_file" "note"` with `- content = "a note\n"` and `+ content = "a better note\n"`. Apply does exactly that.
## 3
In main.tf:
    content  = "a better note\n"
then
    terraform plan
    terraform apply -auto-approve
