# tracked is separate from on-disk: git rm --cached untracks a file without deleting it
Lesson: git has two ideas of a file: the copy on disk, and the staged entry saying "this belongs to the project". Commits snapshot the entries. `git rm` removes both. `git rm --cached` removes only the entry — the file stays on disk, the next commit will not contain it, `git status` shows it as untracked.
That is the tool for "this should never have been committed": secrets, local settings, build output. Combine it with the previous level: amend takes whatever is staged, including a removal. A file that only ever lived in the tip commit vanishes from history.
If a secret was already pushed, rewriting is not enough: rotate the key.
    git show --stat HEAD           which files the tip commit contains
    git rm --cached <file>         untrack; keep the file on disk
    git commit --amend --no-edit   fold the staged change into the tip commit
    git log --oneline -- <file>    every commit that touched this file
Try it first: `git ls-files` lists the tracked files; compare with `ls -a`.
Your task: "`.env` with the Stripe key was committed together with `config.py`. Nothing pushed yet." Repo: `~/.k8s-wargame/git/repo`.
Goal: no commit in `main`'s history contains `.env`; `config.py` stays committed; the `.env` file stays on disk (untracked) — the dev still needs it locally. Still 2 commits.
Check yourself:  wg check      stuck?  wg hint
