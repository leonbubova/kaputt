## 1
Terraform has built-in functions you call inside any expression: `name(argument)`. They transform values at plan time — you never write the result yourself.
## 2
`upper(var.word)` returns the variable uppercased. Use it in the file's `content` (concatenate a newline with `"${...}\n"`).
## 3
    variable "word" { type = string, default = "hello" }
    resource "local_file" "shout" {
      filename = "${path.module}/out/shout.txt"
      content  = "${upper(var.word)}\n"
    }
