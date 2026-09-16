# apply errors: Missing resource instance key
"A counted resource plus an output, and apply blows up: `Because local_file.node has "count" set, its attributes must be accessed on specific instances`. The output should point at the first file. Fix the reference."
Goal: apply succeeds; output `first` is the path of the counted resource's first instance (ends in `n-0.txt`).
