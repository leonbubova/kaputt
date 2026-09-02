## 1
Terraform works in stages: `init` fetches providers, then `plan` evaluates the config — plan can't start while init fails, so the second error only shows once the first is gone. Fix them in order: first the `init` error (provider version), then the `plan` error (attribute).
## 2
`random`'s `~> 99.0` is impossible (use `~> 3.6`); and `random_pet` has no `.name` (use `.id`).
## 3
Set `random = { ... version = "~> 3.6" }`, and replace `random_pet.p.name` with `random_pet.p.id` in both places.
