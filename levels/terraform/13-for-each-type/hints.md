## 1
`for_each` accepts a set or a map, but the variable is a `list`.
## 2
Convert the list to a set with `toset(...)`.
## 3
    for_each = toset(var.envs)
