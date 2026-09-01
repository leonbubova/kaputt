# merge stopped with CONFLICT in config.yaml
"Merging `feature/timeouts` into `main` conflicted. Both sides are right: main raised retries, the branch raised the timeout." Repo: `~/.k8s-wargame/git/repo`.
Goal: the merge is completed on `main` (a real merge commit), `config.yaml` has `retries: 5` **and** `timeout: 30`, no conflict markers, clean tree.
