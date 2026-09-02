## 1
`ls -l /etc/app/db.conf` — owner, group and mode in one line. Two commands fix it: `chown` for owner/group, `chmod` for the mode.
## 2
Octal modes: owner/group/others, r=4 w=2 x=1. `640` = owner rw (6), group r (4), others nothing (0).
## 3
`chown app:app /etc/app/db.conf && chmod 640 /etc/app/db.conf`
