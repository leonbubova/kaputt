## 1
The branch ref is gone, the commits are not. HEAD was on that branch recently — `git reflog` remembers every checkout and commit.
## 2
Find the line `commit: Test CSV export` (the branch tip) in `git reflog`. That hash is your branch.
## 3
`git branch feature/export <hash>` — or `git branch feature/export HEAD@{1}` if the checkout to main was the last move.
