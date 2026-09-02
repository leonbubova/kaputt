## 1
`git log --oneline main..release/1.2` — two commits only the release branch has. You want exactly one of them.
## 2
`git cherry-pick <hash>` copies a single commit onto the current branch.
## 3
`git switch main && git cherry-pick $(git log --format=%H -1 --grep="null check" release/1.2)`.
