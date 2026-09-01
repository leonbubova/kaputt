## 1
`reset --hard` moves the branch; the commits still exist as objects. Git keeps a diary of where HEAD was: `git reflog`.
## 2
Find the entry just before `reset: moving to HEAD~2` — that's where main was. Its hash (or `HEAD@{1}`) is your target.
## 3
`git reset --hard HEAD@{1}` (or the hash). `git log --oneline` should show 3 commits, `cat notes.md` the full notes.
