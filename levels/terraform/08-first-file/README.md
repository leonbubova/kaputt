# we need terraform to drop a marker file
"Bootstrap the play area: write a `local_file` resource that creates `out/hello.txt` containing exactly `hello, terraform`. `terraform apply` should produce the file."
Goal: after apply, `out/hello.txt` exists and its single line is `hello, terraform`.
