## 1
`git show --stat HEAD` lists what the last commit contains. Which file shouldn't be there?
## 2
Untrack without deleting: `git rm --cached .env`. Then fold that change into the existing commit instead of making a new one.
## 3
`git rm --cached .env && git commit --amend --no-edit`. Check with `git show --stat HEAD` and `ls -a`.
