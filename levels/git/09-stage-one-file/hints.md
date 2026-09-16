## 1
A commit contains only what you staged, not everything that changed — `git add` picks what goes into the next commit, you don't have to add everything. `git status` shows both files as modified.
## 2
`git add app.py` alone, then `git status`: app.py "to be committed", notes.md still "not staged".
## 3
`git add app.py && git commit -m "Return explicit status code"`. Don't use `git commit -a` — that would take notes.md too.
