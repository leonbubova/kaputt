# compliance: every provider must be declared and pinned
"`main.tf` uses `random_pet`, but `versions.tf` never declares the random provider — terraform just guesses. Declare it in `required_providers` as `hashicorp/random` pinned to `~> 3.6`."
Goal: `terraform providers` lists `hashicorp/random] ~> 3.6`; init and apply still write `out/name.txt`.
