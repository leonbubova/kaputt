## 1
A branch is only a pointer to a commit; the commit doesn't care which name points at it. So the work is safe as long as *some* branch points at it — create one where you are now, then move main back. `git log --oneline main origin/main` shows main one commit ahead.
## 2
`git branch feature/search` keeps the commit reachable. Then move `main` back one commit.
## 3
`git branch feature/search && git reset --hard origin/main` (or `git reset --keep HEAD~1`). Verify with `git log --oneline --all`.
