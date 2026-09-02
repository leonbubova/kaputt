## 1
A merge brings *everything* a branch has; when you want just one commit, you copy that commit's change onto your branch instead and leave the rest behind. `git log --oneline main..release/1.2` — two commits only the release branch has, you want exactly one of them.
## 2
`git cherry-pick <hash>` copies a single commit onto the current branch.
## 3
`git switch main && git cherry-pick $(git log --format=%H -1 --grep="null check" release/1.2)`.
