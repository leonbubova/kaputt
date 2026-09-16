# CI needs the path of the last node file
"`main.tf` already creates three node files with `count`. Add an output `last_node` whose value is the `filename` of the third node file — read it from the resource, don't paste the path."
Goal: `terraform output -raw last_node` prints a path ending in `node-2.txt`.
