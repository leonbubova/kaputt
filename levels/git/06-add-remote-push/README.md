# a remote is a named address of another repo; push copies your commits there
Lesson: a git repository is complete on its own — nothing about it knows a server. Sharing works by pointing at another repository, which can be a URL or simply a path on the same disk. That pointer is a remote: a short name (`origin` by convention) for a long address.
Pushing copies commits and moves a branch pointer in the remote repo to match yours. After a push, git keeps a local read-only bookmark `origin/main` that remembers where the remote's `main` was last seen. `git status` uses it to say "ahead by 2" or "up to date".
`-u` on the first push links your local branch to the remote one, so later `git push` and `git pull` need no arguments.
    git remote -v                  list remotes and their addresses
    git remote add <name> <addr>   register a remote
    git push -u <remote> <branch>  copy the branch there and remember the link
    git branch -r                  remote-tracking branches like origin/main
    git ls-remote <remote>         ask the remote what branches it has
Try it first: `git remote -v` in the repo prints nothing; `git ls-remote ~/.k8s-wargame/git/origin.git` prints nothing too — an empty bare repo, ready to receive.
Your task: "The central bare repo is ready at `~/.k8s-wargame/git/origin.git` (empty). Our repo `~/.k8s-wargame/git/repo` has no remote yet."
Goal: remote `origin` points at that path and `main` is pushed, so the remote's `main` equals ours.
Check yourself:  wg check      stuck?  wg hint
