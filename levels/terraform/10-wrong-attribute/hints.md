## 1
Each resource type exports a fixed set of attributes defined by its provider's schema — you can only reference those, and Terraform checks every reference at plan time. The error names the attribute that does not exist: `.name`.
## 2
`random_pet` exports its value as `.id`, not `.name`.
## 3
Replace every `random_pet.n.name` with `random_pet.n.id`.
