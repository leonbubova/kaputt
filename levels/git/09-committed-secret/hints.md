## 1
A commit is a snapshot of the staged files; once a file is in it, it stays in history until that commit itself is replaced. Nothing is pushed, so the last commit can still be replaced. `git show --stat HEAD` lists what it contains — which file shouldn't be there?
## 2
Untrack without deleting: `git rm --cached .env`. Then fold that change into the existing commit instead of making a new one.
## 3
`git rm --cached .env && git commit --amend --no-edit`. Check with `git show --stat HEAD` and `ls -a`.
