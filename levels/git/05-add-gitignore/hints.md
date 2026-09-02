## 1
Patterns in a `.gitignore` file at the repo root tell git which untracked files to hide. One pattern per line; `*` is a wildcard.
## 2
`echo '*.log' > .gitignore` — `git status` now shows only `.gitignore` as untracked. Test a pattern with `git check-ignore -v debug.log`.
## 3
`echo '*.log' > .gitignore && git add .gitignore && git commit -m "Ignore log files"`.
