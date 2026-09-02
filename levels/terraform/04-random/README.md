# random values are resources: generated once, kept in state
Lesson: in terraform, randomness is not a function call that re-rolls on every run. The `random` provider models random values as resources: on create the value is generated and saved into the state file; every later plan reads the stored value back instead of rolling again. That is what makes a random name stable — the same config gives the same name until the resource is destroyed.
This is the state file doing its job: it remembers what exists so a repeated plan can say "no changes". A plan that keeps wanting to replace something is churn — a value computed outside state.
`random_pet` produces a readable name like `curious-otter`. Its generated value lives in the `.id` attribute — there is no `.name`. Reference it exactly like any other attribute.
    resource "random_pet" "n" { length = 2 }    a two-word name, generated on create
    random_pet.n.id                              the generated value (not .name)
    terraform plan                               after apply: "No changes" means state holds the value
    terraform state show random_pet.n            see what state remembers about it
Try it first: apply once, then `terraform plan` twice — the name does not move.
Your task: use `random_pet` to generate a two-word name, write it to `out/name.txt`, and expose it as output `pet`. It must stay the same across plans (no churn).
Goal: apply writes a non-empty `out/name.txt`; output `pet` equals it; a follow-up plan shows no changes.
Check yourself:  wg check      stuck?  wg hint
