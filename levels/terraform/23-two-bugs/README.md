# rewritten module won't init AND won't plan
"A rushed rewrite: `terraform init` fails on a provider constraint, and once that's past, plan fails on an attribute that doesn't exist. Two separate mistakes. `out/name.txt` must end up holding the generated pet name, exposed as output `pet`."
Goal: init and apply succeed; output `pet` is non-empty and equals `out/name.txt`.
