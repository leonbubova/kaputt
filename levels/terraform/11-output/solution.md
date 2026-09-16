Add an output referencing the resource attribute.
    output "file_content" { value = trimspace(local_file.hello.content) }
