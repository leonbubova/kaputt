# an output exposes a value, and <type>.<name>.<attribute> reads one from a resource
Lesson: after apply, a resource has attributes — the arguments you wrote plus values the provider computed. Any block can read them with the reference `<type>.<name>.<attribute>`: `local_file.hello.content` is the content of the resource named `hello`. References are also how terraform learns the order of things: a block that references another is created after it.
An `output` block is the config's return value. It has no effect on infrastructure; it prints after apply and can be read back by scripts and CI with `terraform output`. Outputs are how a value leaves terraform without anyone parsing state files.
Terraform has built-in functions for shaping values; `trimspace(...)` strips leading and trailing whitespace, including a trailing newline.
    output "x" { value = local_file.hello.content }    expose a value under the name x
    local_file.hello.content                            reference = type.name.attribute
    trimspace(s)                                        function: drop surrounding whitespace/newlines
    terraform output -raw x                             read one output as plain text (what CI does)
Try it first: `terraform output` with no arguments — lists every output the config declares.
Your task: create `out/hello.txt` with content `hello, world`, and expose an output named `file_content` whose value is that file's content (trimmed). CI runs `terraform output -raw file_content`.
Goal: `terraform output -raw file_content` prints `hello, world`.
Check yourself:  wg check      stuck?  wg hint
