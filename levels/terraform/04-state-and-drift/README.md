# the state file — what terraform remembers
Lesson: `terraform.tfstate` is terraform's memory: a list of everything it created, with the values it saw last.
Every plan compares three things: your `.tf` description, the state, and reality. If reality has changed behind
terraform's back (someone deleted a file by hand), the plan notices and offers to put it back. That gap is called drift.
Two commands to look at the memory:
    terraform state list      one line per resource terraform knows
    terraform show            every resource with all its values
This level has two resources applied: `out/note.txt` and `out/todo.txt`. Then somebody deleted `out/todo.txt` by hand.
Try it:
    wg shell
    terraform state list
    ls out
State lists both files; `ls out` shows only one.
Your task: run `terraform plan` and read it — it wants to `+ create` `local_file.todo` again ("1 to add"). Then
`terraform apply -auto-approve` to bring the file back. `cat out/todo.txt` must show `buy milk`. Do not create the file by hand.
Work in ~/.k8s-wargame/terraform/app — `wg shell` drops you there with terraform ready (type `exit` to come back; `wg check` works inside too).
Check yourself:  wg check      stuck?  wg hint
