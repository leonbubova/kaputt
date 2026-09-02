## 1
`git log --oneline main origin/main` — main is one commit ahead. A branch is only a pointer; create one where you are now.
## 2
`git branch feature/search` keeps the commit reachable. Then move `main` back one commit.
## 3
`git branch feature/search && git reset --hard origin/main` (or `git reset --keep HEAD~1`). Verify with `git log --oneline --all`.
