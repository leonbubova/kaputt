# undo an uncommitted change — git restore
Lesson: this is why you take snapshots. If you break a file, git can put back the version from the last
snapshot — as long as you have not committed the broken one:
    git restore hello.txt        throw away the edits to hello.txt, back to the last snapshot
Only the edits since the last commit are lost; the snapshots stay. `git status` afterwards is clean.
Try it:
    cd ~/.k8s-wargame/git/repo
    cat hello.txt        someone replaced the text with garbage
    git status           hello.txt is modified
    git diff             the - lines are the good version
Your task: bring `hello.txt` back to the last snapshot. Afterwards `cat hello.txt` says `hello git` again
and `git status` says nothing to commit. Do not make a new commit.
Work in `~/.k8s-wargame/git/repo` — first type `cd ~/.k8s-wargame/git/repo` (or `wg shell` drops you there).
Check yourself:  wg check      stuck?  wg hint
