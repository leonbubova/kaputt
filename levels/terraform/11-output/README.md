# CI needs to read a value back out of terraform
"Create `out/hello.txt` with content `hello, world`, and expose an output named `file_content` whose value is that file's content (trimmed). CI runs `terraform output -raw file_content`."
Goal: `terraform output -raw file_content` prints `hello, world`.
