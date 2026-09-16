## 1
Destroy is the opposite of apply: it removes every resource in the state. The description in main.tf is not touched.
## 2
Same shape as apply, with the word destroy: `terraform destroy -auto-approve`. Afterwards `terraform state list` prints nothing.
## 3
    terraform destroy -auto-approve
    ls out
    terraform state list
