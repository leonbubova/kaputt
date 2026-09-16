## 1
Two steps: `git add FILE` picks the file for the snapshot, `git commit -m "MESSAGE"` takes it. `git status` between the two shows the file as "to be committed".
## 2
Inside `~/.k8s-wargame/git/repo`: `git add hello.txt`, then `git commit -m "First snapshot"`. If git asks for your name and email, set them with the two `git config --global` commands from the lesson and commit again.
## 3
    cd ~/.k8s-wargame/git/repo
    git add hello.txt
    git commit -m "First snapshot"
