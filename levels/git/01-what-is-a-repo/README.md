# a repository: a folder git remembers
Lesson: git is a program that remembers old versions of your files. A folder git watches is called a repository
(repo for short). Inside it, git keeps a hidden folder `.git` with the memory. Each saved version is a commit:
a snapshot of all files, with a short message and an id (a string of letters and digits). Two commands to look:
    git status           what is different from the last snapshot? (here: nothing)
    git log --oneline    the snapshots, newest first, one line each: id, then message
Try it:
    cd ~/.k8s-wargame/git/repo
    ls -a                the hidden .git folder is there
    git status
    git log --oneline
Your task: `git log --oneline` shows exactly one line. Copy its first word (the 7-character id) into the file
`~/.k8s-wargame/git/answer` — for example `echo a1b2c3d > ~/.k8s-wargame/git/answer` with the id you see.
Work in `~/.k8s-wargame/git/repo` — first type `cd ~/.k8s-wargame/git/repo` (or `wg shell` drops you there).
Check yourself:  wg check      stuck?  wg hint
