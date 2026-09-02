# git reset moves a branch pointer; a commit survives as long as some name points at it
Lesson: since a branch is just a pointer, "undo the last commit on main" only means: point `main` somewhere else. `git reset <ref>` moves the current branch to any commit. `--hard` also rewrites the working tree to match.
The commit you left is not deleted, only unreachable — and unreachable commits eventually get garbage-collected. So the safe pattern: give the commit a second name first (a branch), then move the original branch back. Name it before you leave it.
`origin/main` is a ref like any other, so it is a valid reset target. Got it wrong? `git reflog` lists every commit HEAD has pointed at.
    git log --oneline main origin/main    how far main is ahead of the remote
    git branch <name>              new pointer at the current commit, HEAD stays
    git reset --hard <ref>         move the current branch to <ref>, files follow
    git reflog                     every place HEAD has been — your undo history
Try it first: `git log --oneline origin/main..main` — the commits only main has.
Your task: "The search endpoint was committed straight onto `main` instead of a feature branch. `main` must match `origin/main` again before anyone pulls." Repo: `~/.k8s-wargame/git/repo`.
Goal: branch `feature/search` holds the search commit on top of `main`; `main` points where `origin/main` points. Don't lose the work.
Check yourself:  wg check      stuck?  wg hint
