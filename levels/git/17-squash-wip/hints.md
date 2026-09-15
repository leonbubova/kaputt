## 1
Commits can't be edited, but they can be replaced: squashing means building one new commit with the same final tree and pointing the branch at it. Two ways: interactive rebase, or a soft reset. `git log --oneline main..feature/avatar` shows the three to fold.
## 2
Soft reset keeps the files staged: `git reset --soft main` leaves the tree as it was on the tip, with everything in the index.
## 3
`git switch feature/avatar && git reset --soft main && git commit -m "Add user avatar URL"`. Or `git rebase -i main` and mark the last two as `squash`.
