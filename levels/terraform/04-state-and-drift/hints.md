## 1
Terraform still remembers `local_file.todo` in its state and the description still asks for it. Only reality is missing the file — so a plan shows it as something to add, and apply adds it.
## 2
    terraform plan
reads "Plan: 1 to add". The same apply command as before repairs it — no change to main.tf needed.
## 3
    terraform apply -auto-approve
    cat out/todo.txt
