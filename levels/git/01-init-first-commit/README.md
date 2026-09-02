# a repo is a folder with a .git inside, and a commit is a snapshot of staged files
Lesson: git does not live on a server — it lives in a hidden `.git` directory next to your files. `git init` creates it; your files stay untouched, now "untracked".
Recording history is a two-step move. First you stage: `git add` puts the files you name into the staging area, the waiting room for the next snapshot. Then `git commit` turns the waiting room into a commit — a permanent snapshot with a message and a parent.
The mental model: working tree (your files) -> staging area (what the next commit will contain) -> history (commits). `git status` always tells you which of the three a file is in.
    git init                       create .git here; files become untracked
    git status                     which files are untracked / staged / clean
    git add <file>...              stage: put files into the next snapshot
    git commit -m "msg"            record the staged files as a commit
    git log --oneline              the commits so far
Try it first: `ls -a ~/.k8s-wargame/git/repo` — no `.git` yet; `git status` there fails with "not a git repository".
Your task: "`shop-api` lives in `~/.k8s-wargame/git/repo` — two files, no git. Put it under version control." If git asks who you are, set `git config user.name` and `user.email` first.
Goal: the directory is a git repository whose first commit contains `README.md` and `app.py`; nothing left uncommitted.
Check yourself:  wg check      stuck?  wg hint
