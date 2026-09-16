# db.conf: owner reads and writes, group reads, nobody else
Ticket: "Audit finding: `/etc/app/db.conf` is world-writable. It must be owned by `app`, group `app`, mode exactly `640` (`-rw-r-----`)." Don't change the content.
Goal: `stat -c '%U:%G %a' /etc/app/db.conf` → `app:app 640`.
