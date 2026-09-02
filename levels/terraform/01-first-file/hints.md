## 1
Terraform never runs commands — you declare the thing you want as a `resource` block and `apply` makes reality match. A file on disk is a resource too. You need a `resource "local_file" "..." { }` block in a `.tf` file.
## 2
`local_file` needs `filename` and `content`. Put the file under `${path.module}/out/`.
## 3
    resource "local_file" "hello" {
      filename = "${path.module}/out/hello.txt"
      content  = "hello, terraform\n"
    }
Then `terraform init && terraform apply -auto-approve`.
