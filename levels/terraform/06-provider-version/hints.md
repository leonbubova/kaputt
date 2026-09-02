## 1
Read the init error: it is about the `random` provider's version constraint.
## 2
`version = "~> 99.0"` allows only 99.x, which does not exist. The mirror has 3.x.
## 3
Set `random`'s version to `~> 3.6` in `required_providers`, then `terraform init`.
