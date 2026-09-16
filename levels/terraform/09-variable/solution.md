Introduce an input variable and interpolate it.
    variable "greeting" { default = "hi" }
    content = "${var.greeting}, world\n"
