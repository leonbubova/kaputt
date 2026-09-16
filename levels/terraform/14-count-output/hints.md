## 1
A resource with `count` is a list of instances; `local_file.node` alone is the whole list, not one file.
## 2
Pick one instance with an index in square brackets — indexes start at 0, so the third is `[2]`. Then read its attribute as usual.
## 3
    output "last_node" { value = local_file.node[2].filename }
