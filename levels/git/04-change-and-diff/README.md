# change a file, see the difference
Lesson: after a snapshot you keep editing. `git status` then lists the file as modified. To see what
exactly changed, ask for the difference:
    git diff             lines starting with - are the old version, lines with + are the new one
Saving the change is the same two steps as before: `git add hello.txt`, then `git commit -m "..."`.
That is the whole daily loop of git: edit → status → diff → add → commit.
Try it:
    cd ~/.k8s-wargame/git/repo
    cat hello.txt        it says: hello git
    git status           nothing to commit — the file matches the snapshot
Your task: change the text in `hello.txt` to exactly `hello again` (`echo hello again > hello.txt` does it).
Look at `git diff`, then save the change as a second snapshot. `git log --oneline` shows two lines afterwards.
Work in `~/.k8s-wargame/git/repo` — first type `cd ~/.k8s-wargame/git/repo` (or `wg shell` drops you there).
Check yourself:  wg check      stuck?  wg hint
