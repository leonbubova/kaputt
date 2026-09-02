## 1
Creating a file needs write permission on the *directory*, not on the file — so a fresh log fails when the dir belongs to someone else. Reproduce as the user: `su - app -c /opt/app/run.sh`. Which path is denied? `ls -ld` that directory.
## 2
`/var/log/app` is `root:root 755` — `app` can list it but not create files in it.
## 3
`chown app:app /var/log/app` (or `chgrp app` + `chmod 775`).
