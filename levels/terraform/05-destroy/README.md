# tearing it all down: destroy
Lesson: `terraform destroy` removes everything terraform created — everything in its state — and empties the state.
Your `.tf` files stay untouched: the description survives, so a later `terraform apply` builds it all again.
It shows a plan with `-` lines and asks for a yes; `-auto-approve` answers for you, exactly like apply.
    terraform destroy -auto-approve
This level has two files applied: `out/note.txt` and `out/todo.txt`.
Try it:
    wg shell
    terraform state list
    ls out
Your task: run `terraform destroy -auto-approve`. Afterwards `ls out` shows nothing, `terraform state list` prints nothing,
and `main.tf` is still there. Do not delete the files by hand and do not delete `terraform.tfstate`.
Work in ~/.k8s-wargame/terraform/app — `wg shell` drops you there with terraform ready (type `exit` to come back; `wg check` works inside too).
Check yourself:  wg check      stuck?  wg hint
