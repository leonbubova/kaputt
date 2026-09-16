## 1
Three digits, one per column: owner, group, others. Add r=4, w=2, x=1. "read and write" is 6, "read only" is 4.
## 2
`-rw-r--r--` is 6 4 4 → `chmod 644 /srv/notes/plan.txt`. Verify with `ls -l /srv/notes`.
## 3
    chmod 644 /srv/notes/plan.txt
