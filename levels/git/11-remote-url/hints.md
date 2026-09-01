## 1
The error names the URL git tried. Compare: `git remote -v`.
## 2
The remote is a path on this machine. Point `origin` at the new one: `git remote set-url origin <path>`.
## 3
`git remote set-url origin ~/.k8s-wargame/git/origin.git && git push`.
