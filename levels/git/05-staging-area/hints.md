## 1
`git add` only puts a file on the staging list; nothing is saved until `git commit`. A new file starts as untracked and becomes staged after add.
## 2
In `~/.k8s-wargame/git/repo`: create `second.txt`, then `git add second.txt`, then `git status` — it must be under "Changes to be committed". No commit.
## 3
    cd ~/.k8s-wargame/git/repo
    echo second file > second.txt
    git add second.txt
    git status
