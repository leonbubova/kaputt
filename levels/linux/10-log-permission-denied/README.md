# creating a file needs write permission on the directory, not the file
Lesson: a directory is a list of names. Adding a name to that list — creating a new file — is a write to the directory. So whether `app` may create `/var/log/app/app.log` depends on the mode and owner of `/var/log/app`, not on the file, which does not even exist yet.
`755 root:root` on a directory means: root may add files, everyone else may only list and enter it. A service that wants to write a fresh log there gets "Permission denied" on the path, and the error looks like it is about the file.
`ls -l DIR` lists what is *inside*; `ls -ld DIR` shows the directory entry itself — that is the line you need. Fix by giving the directory to the user (`chown`) or opening the group (`chgrp` + `chmod 775`).
    su - app -c CMD           reproduce as the affected user
    ls -ld /var/log/app       owner and mode of the directory itself
    chown app:app DIR         hand the directory to the user
    chown -R app:app DIR      same, including everything inside
Try it first: `ls -ld /tmp /var/log` — compare the modes; one is meant for everyone.
Your task: "`/opt/app/run.sh` is started as user `app` and fails with `Permission denied` on the log. Worked yesterday, then ops 'cleaned up /var/log'."
Goal: `su - app -c /opt/app/run.sh` prints `run ok` and `/var/log/app/app.log` gets the entry. Log must stay in `/var/log/app/`.
Check yourself:  wg check      stuck?  wg hint
