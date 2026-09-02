# a branch is a movable name for a commit, so you can work without touching main
Lesson: a branch is not a copy of the project. It is a tiny file holding one commit id — a pointer. Creating `feature/x` makes a second pointer at the same commit as `main`. Cheap and instant.
What makes a branch feel like a separate line of work is HEAD: the name of the branch you are "on". When you commit, only HEAD's branch moves forward to the new commit. Every other branch stays where it was.
Switching branches moves HEAD and rewrites your working tree to match that commit. The loop: create, switch, commit there, switch back — main never saw any of it.
    git branch                     list branches; * marks the one HEAD is on
    git switch -c <name>           create a branch here and switch to it
    git switch <name>              move HEAD (and your files) to that branch
    git log --oneline --all        history of every branch, not just the current one
Try it first: `cat .git/HEAD` in the repo, then `cat .git/refs/heads/main` — a name, and a commit id.
Your task: "Add `greeting.py` (any content with a `def greet`) on a new branch `feature/greeting`, then come back to `main` so it's ready for the next hotfix." Repo: `~/.k8s-wargame/git/repo`.
Goal: `feature/greeting` has one commit on top of `main` adding `greeting.py`; `main` unchanged; HEAD is on `main` with a clean tree.
Check yourself:  wg check      stuck?  wg hint
