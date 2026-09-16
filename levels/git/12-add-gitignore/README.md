# git status is cluttered with log files
"Every run writes `debug.log` and it shows up in `git status`. Make git ignore all `*.log` files — for everyone, so it must be committed." Repo: `~/.k8s-wargame/git/repo`.
Goal: `*.log` files are ignored via a committed `.gitignore`; `debug.log` still exists on disk; `git status` is clean.
