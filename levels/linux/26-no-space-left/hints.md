## 1
`df` reports what the filesystem has used; `du` adds up only what you point it at — when they disagree, you are not pointing at everything (a `*` glob skips dotfiles). `df -h /var/lib/appdata` confirms 100%; `du -sh /var/lib/appdata/*` does not add up.
## 2
`du -ah /var/lib/appdata | sort -h | tail` shows everything, hidden dirs included.
## 3
`rm /var/lib/appdata/.cache/tmp/core.4123` — a stray core dump in a hidden cache dir.
