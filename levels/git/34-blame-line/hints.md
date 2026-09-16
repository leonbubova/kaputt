## 1
Every line of a tracked file remembers the commit that last changed it. `git blame <file>` prints that commit, author and date in front of each line.
## 2
`git blame worker.py` — find the `TIMEOUT = 30` line, read the name on it. `-L /TIMEOUT/,+1` limits the output to that line.
## 3
`git blame -L '/TIMEOUT = 30/,+1' --porcelain worker.py | grep ^author` → write the name to `~/.k8s-wargame/git/answer`.
