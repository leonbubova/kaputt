Use count and count.index.
    resource "local_file" "node" {
      count    = 3
      filename = "${path.module}/out/node-${count.index}.txt"
      content  = "node ${count.index}\n"
    }
