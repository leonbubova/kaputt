## 1
The message is part of the commit, so 'changing' it really means replacing the commit with a new one — safe for the newest commit as long as nobody has pulled it. `git log --oneline -3` — only the top one is wrong.
## 2
The newest commit can be rewritten in place: `git commit --amend` opens the message in your editor.
## 3
`git commit --amend -m "Add login endpoint"` — no `git add` first, or you'd change the content too.
