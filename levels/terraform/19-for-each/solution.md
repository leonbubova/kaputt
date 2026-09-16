Use for_each over a map with each.key / each.value.
    resource "local_file" "region" {
      for_each = { eu = "Europe", us = "United States" }
      filename = "${path.module}/out/${each.key}.txt"
      content  = "${each.value}\n"
    }
