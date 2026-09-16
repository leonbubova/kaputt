## 1
A clone doesn't watch the server. `origin/main` is your last known copy of the remote and only updates when you ask: `git fetch`, then `git log --oneline main origin/main` shows origin one commit ahead.
## 2
`git pull` = fetch + merge into the current branch. Nothing changed locally, so it's a plain fast-forward.
## 3
`git pull`. `git log --oneline -2` shows "Add metrics endpoint" on top.
