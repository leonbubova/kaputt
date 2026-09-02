## 1
`origin` is just a saved address; git doesn't know the server moved and keeps pushing to the old path. The error names the URL it tried — compare with `git remote -v`.
## 2
The remote is a path on this machine. Point `origin` at the new one: `git remote set-url origin <path>`.
## 3
`git remote set-url origin ~/.k8s-wargame/git/origin.git && git push`.
