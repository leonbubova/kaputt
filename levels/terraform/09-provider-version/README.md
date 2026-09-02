# 'terraform init' fails: no available releases match
"A teammate pinned the random provider and now nobody can init: `Error: Failed to query available provider packages ... no available releases match the given constraints`. The config itself is fine. Make init succeed."
Goal: `terraform init` and `apply` succeed; `out/name.txt` is written by `random_pet`.
