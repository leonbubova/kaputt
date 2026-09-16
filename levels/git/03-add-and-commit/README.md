# git add + git commit — save a snapshot
Lesson: saving a snapshot is two steps. First you tell git which files belong in it, then you take it:
    git add hello.txt              put hello.txt into the next snapshot
    git commit -m "First snapshot" take the snapshot, with that message
The message (in quotes, after `-m`) is a note to your future self: what this snapshot is. After the commit,
`git status` says "nothing to commit" and `git log --oneline` shows your snapshot. If git asks who you
are, run `git config --global user.name "Your Name"` and `git config --global user.email "you@example.com"` once, then commit again.
Try it:
    cd ~/.k8s-wargame/git/repo
    git status           hello.txt is untracked
Your task: make the first snapshot of the repo. It must contain `hello.txt`; the message is up to you.
Afterwards `git log --oneline` shows one line and `git status` says nothing to commit.
Work in `~/.k8s-wargame/git/repo` — first type `cd ~/.k8s-wargame/git/repo` (or `wg shell` drops you there).
Check yourself:  wg check      stuck?  wg hint
