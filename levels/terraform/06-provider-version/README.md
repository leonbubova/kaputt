# init resolves provider versions; an impossible constraint stops everything before plan
Lesson: terraform itself knows nothing about files or random names — providers do. `versions.tf` lists them in `required_providers`, each with a `source` and a version constraint. `terraform init` reads that list, finds a released version that satisfies every constraint, and installs it. Only then can plan or apply run.
Errors come in order: init (providers, versions) → plan (syntax, references) → apply (real-world failures). An init error means your resources have not been looked at yet. Read the init message: it names the provider and the constraint it could not satisfy.
Constraints: `~> 3.6` means 3.6 or any newer 3.x, never 4.0. In this play area providers come from an offline mirror holding local 2.x, random 3.x, null 3.x; a constraint outside those ranges matches nothing.
    terraform init                          resolve and install providers — the first thing that can fail
    terraform providers                     which providers the config requires, with constraints
    version = "~> 3.6"                      pessimistic constraint: >= 3.6, < 4.0
    terraform init -upgrade                 re-resolve after changing a constraint
Try it first: `terraform providers` — compare the constraints it prints with what the init error says.
Your task: a teammate pinned the random provider and now nobody can init: `Error: Failed to query available provider packages ... no available releases match the given constraints`. The config itself is fine. Make init succeed.
Goal: `terraform init` and `apply` succeed; `out/name.txt` is written by `random_pet`.
Check yourself:  wg check      stuck?  wg hint
