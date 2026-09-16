# change a value, read the plan
Lesson: to change something, you do not touch the file in `out/` — you change the description in `main.tf` and apply
again. Terraform sees the difference and does only that. `terraform plan` shows the difference WITHOUT doing anything —
read it before every apply. Its symbols:
    + create      - destroy      ~ change in place      -/+ replace (destroy, then create anew)
A file's content cannot be edited in place by terraform, so a changed `content` shows as `-/+` "must be replaced",
with the old line marked `-` and the new one `+`. Plan ends with a count: "Plan: 1 to add, 0 to change, 1 to destroy."
This level is already initialized and applied: `out/note.txt` says `a note`.
Try it:
    wg shell
    terraform plan
It says "No changes." — the description and reality agree.
Your task: in `main.tf` change the content from `a note\n` to `a better note\n` (keep the `\n`). Save. Run `terraform plan`
and find the `-` and `+` lines. Then `terraform apply -auto-approve`. `cat out/note.txt` must show `a better note`.
File: ~/.k8s-wargame/terraform/app/main.tf — open it in any editor (VS Code: `code ~/.k8s-wargame/terraform/app`). Commands: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
