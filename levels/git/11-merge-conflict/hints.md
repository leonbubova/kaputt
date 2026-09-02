## 1
A conflict means git found two different edits to the same lines and refuses to guess: it leaves both versions in the file between `<<<<<<<` and `>>>>>>>` and pauses the merge until you decide. `git status` lists the file as "both modified"; `git diff` shows the two sides.
## 2
Edit the file so it contains the final content you want (both values), remove the markers, then tell git the conflict is resolved: `git add config.yaml`.
## 3
`git commit` (no `-m` needed — the merge message is prepared). `git log --oneline --graph` should show a merge commit.
