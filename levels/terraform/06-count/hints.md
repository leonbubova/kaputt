## 1
`count = 3` on a resource makes three instances, indexed by `count.index` (0,1,2).
## 2
Use `count.index` in both the filename and the content.
## 3
    resource "local_file" "node" {
      count    = 3
      filename = "${path.module}/out/node-${count.index}.txt"
      content  = "node ${count.index}\n"
    }
