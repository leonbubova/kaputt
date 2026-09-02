## 1
blame answers "who last touched this line" — and moving a line counts as touching it, so blame points at the reorderer, not at whoever wrote the value. `git blame worker.py` shows exactly that person.
## 2
Ask history when the *text* `MAX_RETRIES = 0` appeared: `git log -S'MAX_RETRIES = 0' --format='%an %s' -- worker.py`. Or `git blame -M` to follow moved lines.
## 3
`git log -S'MAX_RETRIES = 0' --format=%an -- worker.py` prints the author. Write that name to `~/.k8s-wargame/git/answer`.
