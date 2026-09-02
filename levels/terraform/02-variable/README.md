# a variable is an input knob: default in the config, override at apply time
Lesson: a value that differs between environments or teammates does not belong hardcoded in a resource. A `variable` block declares an input: a name, a type, and optionally a default. Whoever runs terraform can override it with `-var name=value` (or a tfvars file); the config reads whichever won.
Inside the config you refer to it as `var.<name>`. Put it in a string with `${...}` interpolation, exactly like `${path.module}` in the last level.
The default is what makes the variable optional: with one, a plain `terraform apply` works unattended; without one, terraform stops and asks.
    variable "x" { type = string  default = "hi" }    declare an input with a fallback value
    var.x                                              read it anywhere in the config
    content = "${var.x}, world\n"                      interpolate it into a string
    terraform apply -auto-approve -var x=yo            override the default for this run
Try it first: after apply, run `terraform plan -var x=other` on a config with a variable — the plan shows the change without doing it.
Your task: write `out/greet.txt` containing `<greeting>, world`, where `greeting` is an input variable that defaults to `hi`. Ops must be able to override it with `-var`.
Goal: default apply writes `hi, world`; `apply -var greeting=yo` writes `yo, world`.
Check yourself:  wg check      stuck?  wg hint
