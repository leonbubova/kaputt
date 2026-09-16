## 1
Every file carries three things: an owner, a group, and a mode saying what each may do. They are set by different tools — `chown` for owner/group, `chmod` for the mode. `ls -l /etc/app/db.conf` shows all three in one line.
## 2
Octal modes: owner/group/others, r=4 w=2 x=1. `640` = owner rw (6), group r (4), others nothing (0).
## 3
`chown app:app /etc/app/db.conf && chmod 640 /etc/app/db.conf`
