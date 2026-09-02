# a conflict is git refusing to guess: you write the final lines, add, then commit
Lesson: a real merge (not a fast-forward) combines both sides' changes since the common ancestor. Different lines merge silently. The same lines on both sides: git cannot know which is right, so it stops, writes both versions into the file between markers, and waits.
    <<<<<<< HEAD        your side (the branch you are on)
    =======             separator
    >>>>>>> feature     their side (the branch being merged)
The merge is paused, not failed. Three steps: edit the file to the final content (one side, the other, or both), delete the markers, `git add` it — staging means "resolved". Then `git commit` finishes the merge with the prepared message.
    git status                     "both modified" lists the conflicted files
    git diff                       the two sides, marked ++ / +
    git add <file>                 mark the file as resolved
    git commit --no-edit           complete the merge with the prepared message
    git merge --abort              give up, return to the pre-merge state
Try it first: `git status` in the repo — it says a merge is in progress and names the unmerged path.
Your task: "Merging `feature/timeouts` into `main` conflicted. Both sides are right: main raised retries, the branch raised the timeout." Repo: `~/.k8s-wargame/git/repo`.
Goal: the merge is completed on `main` (a real merge commit), `config.yaml` has `retries: 5` **and** `timeout: 30`, no conflict markers, clean tree.
Check yourself:  wg check      stuck?  wg hint
