## 1
`main` moved after the branch was created, so its pointer can't just slide forward: git builds a new commit that has two parents — the old main tip and the branch tip. `git log --oneline --graph --all` shows the fork.
## 2
Be on the branch you merge INTO, then `git merge feature/i18n`. Different files on both sides, so nothing to resolve; git opens an editor with a prepared message — save and close it.
## 3
`git switch main && git merge feature/i18n`. `git log --oneline --graph` now shows the two lines joining at the top.
