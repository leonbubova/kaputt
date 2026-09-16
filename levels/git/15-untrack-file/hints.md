## 1
Tracked means "in the index"; the file on disk is a separate thing. `git ls-files` lists what is tracked — coverage.xml is in there. Plain `git rm` would delete the file too.
## 2
`git rm --cached <file>` removes it from the index only. `git status` then shows it as "deleted" (staged) and untracked at the same time.
## 3
`git rm --cached coverage.xml && git commit -m "Stop tracking coverage report"`. `ls` still shows the file.
