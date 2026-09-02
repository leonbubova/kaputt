## 1
`git switch main` refuses: report.py is modified and doesn't exist on main. Uncommitted changes can be parked on a stack — the working tree becomes clean, the edit is kept.
## 2
`git stash` parks it (`git stash list` shows one entry). Now switch, edit VERSION, commit, switch back.
## 3
`git stash && git switch main && echo 1.4.1 > VERSION && git commit -am "Bump version to 1.4.1" && git switch feature/report && git stash pop`.
