# merging a branch that is directly ahead just moves the pointer: fast-forward
Lesson: `git merge` combines two lines of history. But when the branch you are on has not moved since the other branch was created, there is nothing to combine — the other branch's commits already sit directly on top of yours. Git simply slides your branch's pointer forward to the other tip. That is a fast-forward: no new commit, the history stays a straight line.
Direction matters. Merge always brings the named branch INTO the branch HEAD is on. "Get feature into main" therefore means: stand on main, merge feature. Standing on feature and merging main would move the wrong pointer.
If the graph shows the other branch as a straight continuation of yours, expect "Fast-forward" in the output.
    git log --oneline --all --graph    the shape: is the branch directly ahead?
    git switch main                    stand on the branch that should move
    git merge <branch>                 bring <branch> in; fast-forward if possible
    git branch --merged                which branches are already contained in HEAD
Try it first: `git log --oneline main..feature/greeting` — the commits feature has that main lacks. Then `git log --oneline feature/greeting..main` — should be empty.
Your task: "`feature/greeting` is reviewed and approved. Get it into `main`." Repo: `~/.k8s-wargame/git/repo`. `main` has not moved since the branch was created.
Goal: `main` points at the same commit as `feature/greeting`; no extra merge commit; HEAD on `main`.
Check yourself:  wg check      stuck?  wg hint
