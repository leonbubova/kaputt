# HEAD normally points at a branch; when it points straight at a commit, it is detached
Lesson: HEAD answers "where am I". Usually it holds a branch name, and commits move that branch. Check out a tag or a commit id and HEAD holds the id directly: detached. You can build and even commit — but no branch moves.
A commit made in detached state has HEAD as its only name. Switch away and it becomes unreachable — that is git's "commit will be lost" warning. No panic needed: while you are still there, `git switch -c <name>` creates a branch at the current commit and attaches HEAD — the level 3 command, now as a rescue.
Already switched away? The id is still in `git reflog`; create a branch at it.
    git status                     first line says "HEAD detached at ..." or "On branch ..."
    git switch -c <name>           create a branch at the current commit, attach HEAD
    git reflog                     the ids HEAD has pointed at, newest first
Try it first: `cat .git/HEAD` — on a branch it reads `ref: refs/heads/...`; detached it is a bare commit id.
Your task: "I checked out tag `v1.0` to test the timeout fix, committed it, and now git says the commit will be lost if I switch away." Repo: `~/.k8s-wargame/git/repo`.
Goal: that commit lives on a branch named `hotfix/timeout`; HEAD is attached to a branch again.
Check yourself:  wg check      stuck?  wg hint
