## 1
Fix them in order: first the `init` error (provider version), then the `plan` error (attribute).
## 2
`random`'s `~> 99.0` is impossible (use `~> 3.6`); and `random_pet` has no `.name` (use `.id`).
## 3
Set `random = { ... version = "~> 3.6" }`, and replace `random_pet.p.name` with `random_pet.p.id` in both places.
