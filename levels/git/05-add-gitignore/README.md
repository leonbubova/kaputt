# .gitignore hides untracked files from git — and is itself a committed file
Lesson: `git status` lists every untracked file so you never forget one. Build output and logs make that list useless. A `.gitignore` file at the repo root lists patterns; untracked files matching a pattern disappear from status and are never picked up by `git add .`.
Patterns are one per line: an exact name (`debug.log`), a wildcard (`*.log`), a directory (`build/`). Ignoring only affects untracked files — an already committed file stays tracked whatever `.gitignore` says.
`.gitignore` is a normal file in the project. For the rule to reach every clone it must be added and committed like any other file. Ignored files stay on disk; git just stops mentioning them.
    git status                     untracked files that need a rule
    echo '*.log' >> .gitignore     add a pattern (one per line)
    git check-ignore -v <file>     which rule, if any, ignores this file
    git status --ignored           show the files that are being hidden
Try it first: `git check-ignore -v debug.log` in the repo — exits 1, no rule matches yet.
Your task: "Every run writes `debug.log` and it shows up in `git status`. Make git ignore all `*.log` files — for everyone, so it must be committed." Repo: `~/.k8s-wargame/git/repo`.
Goal: `*.log` files are ignored via a committed `.gitignore`; `debug.log` still exists on disk; `git status` is clean.
Check yourself:  wg check      stuck?  wg hint
