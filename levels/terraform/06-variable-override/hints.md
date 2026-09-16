## 1
The resource reads its content from `var.color`. You do not change the description — you hand in a different value when you apply.
## 2
Append `-var NAME=VALUE` to the apply command: the name is `color`, the value `red`.
## 3
    terraform apply -auto-approve -var color=red
    cat out/color.txt
