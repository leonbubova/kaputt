## 1
Before anything else, `terraform init` downloads the providers your config requires — a version that satisfies every constraint in `required_providers`. If no published release matches, init stops before it ever looks at your resources. Read the init error: it is about the `random` provider's version constraint.
## 2
`version = "~> 99.0"` allows only 99.x, which does not exist. The mirror has 3.x.
## 3
Set `random`'s version to `~> 3.6` in `required_providers`, then `terraform init`.
