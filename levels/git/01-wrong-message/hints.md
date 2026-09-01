## 1
`git log --oneline -3` — which commit is wrong? Only the newest one.
## 2
The newest commit can be rewritten in place: `git commit --amend` opens the message in your editor.
## 3
`git commit --amend -m "Add login endpoint"` — no `git add` first, or you'd change the content too.
