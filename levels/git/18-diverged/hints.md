## 1
`git fetch && git log --oneline --graph --all` — main and origin/main each have one commit the other doesn't.
## 2
Put your commit on top of theirs instead of merging: `git pull --rebase`.
## 3
`git pull --rebase && git push`.
