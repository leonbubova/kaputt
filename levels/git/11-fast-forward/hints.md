## 1
When the target branch hasn't moved since you branched off, there's nothing to combine: git just slides `main`'s pointer forward to the branch tip — a fast-forward, no merge commit. `git log --oneline --all --graph` shows feature/greeting directly ahead of main.
## 2
Be on the branch you merge INTO: `git switch main`, then `git merge <branch>`.
## 3
`git switch main && git merge feature/greeting` — output says "Fast-forward".
