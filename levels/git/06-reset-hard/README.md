# two commits vanished after a reset --hard
"I meant `git reset --hard HEAD` to drop a stray edit and typed `HEAD~2`. The last two commits on `main` are gone — the release notes were in there." Repo: `~/.k8s-wargame/git/repo`.
Goal: `main` is back at the commit it pointed to before the reset, with `notes.md` complete. Nothing was pushed, there is no other copy.
