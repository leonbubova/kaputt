## 1
The last snapshot still has the good file. `git restore FILE` copies that version back over your edited file.
## 2
Inside `~/.k8s-wargame/git/repo`: `git restore hello.txt`, then `cat hello.txt` and `git status` to confirm.
## 3
    cd ~/.k8s-wargame/git/repo
    git restore hello.txt
