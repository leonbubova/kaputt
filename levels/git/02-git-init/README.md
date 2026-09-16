# git init — start remembering
Lesson: a normal folder becomes a repository with one command, typed inside that folder:
    git init
It creates the hidden `.git` folder — empty memory, no snapshot yet. Your files are untouched. Before
that, `git status` complains "not a git repository"; after it, `git status` lists your files as untracked
(git sees them but has not saved them yet). That is the next lesson.
Try it:
    cd ~/.k8s-wargame/git/repo
    ls -a                no .git yet
    git status           the complaint
Your task: turn `~/.k8s-wargame/git/repo` into a repository. Afterwards `ls -a` shows `.git` and
`git status` shows `hello.txt` as untracked.
Work in `~/.k8s-wargame/git/repo` — first type `cd ~/.k8s-wargame/git/repo` (or `wg shell` drops you there).
Check yourself:  wg check      stuck?  wg hint
