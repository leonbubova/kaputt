# for_each rejects the env list
"We create one file per environment with `for_each`, but plan fails: `Invalid for_each argument ... a set of strings, or a map of strings`. The input is a list of env names. Fix it without abandoning for_each."
Goal: apply succeeds; `out/dev.txt` and `out/prod.txt` both exist.
