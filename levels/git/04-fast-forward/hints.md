## 1
`git log --oneline --all --graph` — feature/greeting is directly ahead of main. Merging then needs no new commit.
## 2
Be on the branch you merge INTO: `git switch main`, then `git merge <branch>`.
## 3
`git switch main && git merge feature/greeting` — output says "Fast-forward".
