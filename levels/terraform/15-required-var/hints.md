## 1
A variable with no default is required; unattended runs (`-input=false`) then fail.
## 2
Give the variable a default so no value must be supplied.
## 3
    variable "port" { type = number, default = 8080 }
