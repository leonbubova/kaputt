## 1
Rebase replays your commits, one by one, onto a new base — as if you had started the branch from today's `main`. Result: a straight line, no merge commit. `git log --oneline --graph --all` shows the two branches forking at the first commit.
## 2
Be on the feature branch, then `git rebase main`. No conflicts here — different files.
## 3
`git switch feature/payments && git rebase main`. `git log --oneline --graph --all` should be a straight line.
