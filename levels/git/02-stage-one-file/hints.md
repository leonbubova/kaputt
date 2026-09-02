## 1
`git status` shows both as modified. `git add` picks what goes into the next commit — you don't have to add everything.
## 2
`git add app.py` alone, then `git status`: app.py "to be committed", notes.md still "not staged".
## 3
`git add app.py && git commit -m "Return explicit status code"`. Don't use `git commit -a` — that would take notes.md too.
