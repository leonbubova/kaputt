## 1
A stash is a commit. Dropping it only removes the reference — the object is still in `.git/objects` until gc.
## 2
List objects nothing points to: `git fsck --unreachable | grep commit`. Inspect candidates with `git show <hash>` — the stash commit has your draft.
## 3
`git stash apply <hash>` (or `git checkout <hash> -- draft.md`). Then `cat draft.md`.
