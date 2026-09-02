## 1
`git log --oneline --graph --all` — the two branches fork at the first commit. Rebase replays your commits onto a new base.
## 2
Be on the feature branch, then `git rebase main`. No conflicts here — different files.
## 3
`git switch feature/payments && git rebase main`. `git log --oneline --graph --all` should be a straight line.
