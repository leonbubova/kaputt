## 1
A branch is a named line of snapshots. `git switch -c NAME` creates NAME from where you stand and moves you onto it; `git branch` shows the * on the branch you are on.
## 2
Inside `~/.k8s-wargame/git/repo`: `git switch -c experiment`, then `git branch` — the * must be on experiment.
## 3
    cd ~/.k8s-wargame/git/repo
    git switch -c experiment
    git branch
