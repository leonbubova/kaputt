Call a built-in function on the variable.
    variable "word" { default = "hello" }
    content = "${upper(var.word)}\n"
