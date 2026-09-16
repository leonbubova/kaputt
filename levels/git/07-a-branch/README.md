# a branch: a second line of snapshots
Lesson: so far every commit went on one line, called `main`. A branch is a second line that starts from the
current snapshot: you can try something there, and `main` stays as it was. Three commands:
    git branch                   list the branches; the * marks the one you are on
    git switch -c experiment     create a branch called experiment and move onto it
    git switch main              move back onto main (switch without -c: the branch exists already)
Commits always land on the branch you are on. Moving between branches changes the files in the folder to
that branch's latest snapshot.
Try it:
    cd ~/.k8s-wargame/git/repo
    git branch           one branch: * main
Your task: create a branch called `experiment` and be on it. `git branch` must show `* experiment`.
Work in `~/.k8s-wargame/git/repo` — first type `cd ~/.k8s-wargame/git/repo` (or `wg shell` drops you there).
Check yourself:  wg check      stuck?  wg hint
