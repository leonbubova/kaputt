## 1
`df -h /var/lib/appdata` confirms 100%. `du -sh /var/lib/appdata/*` does not add up — the glob skips dotfiles.
## 2
`du -ah /var/lib/appdata | sort -h | tail` shows everything, hidden dirs included.
## 3
`rm /var/lib/appdata/.cache/tmp/core.4123` — a stray core dump in a hidden cache dir.
