## 1
`git reset <ref>` moves the branch pointer; the mode decides what happens to the files. `--hard` throws them away, `--soft` leaves index and working tree exactly as they are. `git log --oneline -2` — you want the pointer on the lower one.
## 2
`--soft HEAD~1`: the branch goes back one commit, and everything that commit added shows up in `git status` as "to be committed".
## 3
`git reset --soft HEAD~1`. `git status` lists billing.py as new file, staged.
