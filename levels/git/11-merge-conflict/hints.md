## 1
`git status` lists "both modified: config.yaml". `git diff` shows the two sides between `<<<<<<<` and `>>>>>>>`.
## 2
Edit the file so it contains the final content you want (both values), remove the markers, then tell git the conflict is resolved: `git add config.yaml`.
## 3
`git commit` (no `-m` needed — the merge message is prepared). `git log --oneline --graph` should show a merge commit.
