## 1
`for_each` on a resource creates one instance per element of a map (or set). Inside the block, `each.key` is the map key and `each.value` its value.
## 2
Key = file name, value = content: `for_each = { eu = "Europe", us = "United States" }`.
## 3
    resource "local_file" "region" {
      for_each = { eu = "Europe", us = "United States" }
      filename = "${path.module}/out/${each.key}.txt"
      content  = "${each.value}\n"
    }
