## 1
`terraform init` installs one plugin per provider. Which ones, and which versions are allowed, comes from the `required_providers` block in `versions.tf` — an undeclared provider falls back to `hashicorp/<name>` with no version limit. `terraform providers` shows what the config currently requires.
## 2
Each entry is `<name> = { source = "...", version = "..." }`. `~> 3.6` means "3.6 or any newer 3.x".
## 3
In `versions.tf`, inside `required_providers`, add:
    random = { source = "hashicorp/random", version = "~> 3.6" }
Then `terraform init`.
