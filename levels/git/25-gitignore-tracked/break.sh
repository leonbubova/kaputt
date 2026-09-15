source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf main.sh <<'F'
#!/bin/sh
echo "build $(date)" > build/out.log
F
wf build/out.log <<'F'
build Mon Jan  5 10:00:00 UTC 2026
F
cm "Initial project"
wf .gitignore <<'F'
build/
*.tmp
F
cm "Ignore build output"
wf build/out.log <<'F'
build Tue Jan  6 09:12:41 UTC 2026
F
