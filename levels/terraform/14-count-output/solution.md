Index the counted resource, then read the attribute.
    output "last_node" { value = local_file.node[2].filename }
