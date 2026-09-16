# variables — a value you pass in
Lesson: a value you may want to change per run goes into a `variable` block instead of being typed into the resource.
Open `main.tf`:
    variable "color" {
      type    = string
      default = "blue"
    }
    resource "local_file" "color" {
      filename = "${path.module}/out/color.txt"
      content  = "${var.color}\n"
    }
`var.color` means "the value of the variable color". Inside a quoted string it needs the `${ }` wrapper, like `path.module`.
With nothing else said, the default wins: the file says `blue`. At apply time you can override it on the command line:
    terraform apply -auto-approve -var color=red
This level is already applied with the default — `cat out/color.txt` shows `blue`.
Try it:
    wg shell
    cat out/color.txt
    terraform plan -var color=red
Your task: apply with the variable set to `red`, so `out/color.txt` says `red`. Do not edit `main.tf` — the default stays `blue`.
Work in ~/.k8s-wargame/terraform/app — `wg shell` drops you there with terraform ready (type `exit` to come back; `wg check` works inside too).
Check yourself:  wg check      stuck?  wg hint
