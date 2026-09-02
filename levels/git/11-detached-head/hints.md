## 1
Detached HEAD means HEAD points straight at a commit instead of at a branch; commits made there have no branch name, so nothing keeps them once HEAD moves on. `git status` says where you are; `git log --oneline -1` shows the commit that only HEAD knows about.
## 2
Nothing is lost while HEAD points at it. Give it a name before moving: a branch at the current commit.
## 3
`git switch -c hotfix/timeout` (or `git checkout -b hotfix/timeout`). Now HEAD is attached and the commit is safe.
