## 1
`git log --oneline main..feature/avatar` — three commits to fold. Two ways: interactive rebase, or a soft reset.
## 2
Soft reset keeps the files staged: `git reset --soft main` leaves the tree as it was on the tip, with everything in the index.
## 3
`git switch feature/avatar && git reset --soft main && git commit -m "Add user avatar URL"`. Or `git rebase -i main` and mark the last two as `squash`.
