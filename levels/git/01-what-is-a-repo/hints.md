## 1
A repo is a folder with a hidden `.git` inside. `git log --oneline` lists its snapshots; each line starts with the snapshot's id.
## 2
Run `git log --oneline` inside `~/.k8s-wargame/git/repo`. The first word of the only line is the id. Put it into the file with `echo ID > ~/.k8s-wargame/git/answer`.
## 3
    cd ~/.k8s-wargame/git/repo
    git log --oneline
    echo THE-ID-YOU-SAW > ~/.k8s-wargame/git/answer
