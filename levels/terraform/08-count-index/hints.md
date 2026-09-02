## 1
A resource with `count` is a list of instances; you cannot reference it without an index.
## 2
Pick the first instance with `[0]`.
## 3
    output "first" { value = local_file.node[0].filename }
