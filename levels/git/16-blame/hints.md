## 1
`git blame worker.py` shows who last touched each line — "last touched" includes moving it. That's the person who says he only reordered.
## 2
Ask history when the *text* `MAX_RETRIES = 0` appeared: `git log -S'MAX_RETRIES = 0' --format='%an %s' -- worker.py`. Or `git blame -M` to follow moved lines.
## 3
`git log -S'MAX_RETRIES = 0' --format=%an -- worker.py` prints the author. Write that name to `~/.k8s-wargame/git/answer`.
