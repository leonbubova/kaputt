## 1
A push must be a fast-forward: the remote only accepts your branch if it already contains everything the remote has. When both sides gained a commit, you first have to put yours on top of theirs. `git fetch && git log --oneline --graph --all` shows main and origin/main one commit apart each.
## 2
Put your commit on top of theirs instead of merging: `git pull --rebase`.
## 3
`git pull --rebase && git push`.
