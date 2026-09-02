Give the second resource a unique name.
    resource "local_file" "app2" { filename = "${path.module}/out/b.txt", content = "b\n" }
