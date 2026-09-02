## 1
Declare `variable "greeting" { default = "hi" }` and reference it as `var.greeting`.
## 2
Interpolate it in the content: `"${var.greeting}, world\n"`.
## 3
    variable "greeting" { type = string, default = "hi" }
    resource "local_file" "greet" {
      filename = "${path.module}/out/greet.txt"
      content  = "${var.greeting}, world\n"
    }
