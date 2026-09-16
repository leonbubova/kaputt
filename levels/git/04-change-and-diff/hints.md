## 1
Editing a file does not change the snapshot. `git status` shows it as modified, `git diff` shows the old (-) and new (+) lines. Saving is add + commit again.
## 2
`echo hello again > hello.txt` in `~/.k8s-wargame/git/repo`, then `git diff` to look, then `git add hello.txt` and `git commit -m "Change the greeting"`.
## 3
    cd ~/.k8s-wargame/git/repo
    echo hello again > hello.txt
    git diff
    git add hello.txt
    git commit -m "Change the greeting"
