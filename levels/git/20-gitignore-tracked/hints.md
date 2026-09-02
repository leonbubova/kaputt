## 1
`.gitignore` only affects untracked files. `git ls-files build/` — is the file tracked?
## 2
Remove it from the index but not from disk: `git rm --cached build/out.log`.
## 3
`git rm --cached build/out.log && git commit -m "Stop tracking build output"`. Then `git status` — clean.
