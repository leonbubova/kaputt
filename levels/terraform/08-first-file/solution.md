Declare a local_file resource and apply.
    resource "local_file" "hello" {
      filename = "${path.module}/out/hello.txt"
      content  = "hello, terraform\n"
    }
