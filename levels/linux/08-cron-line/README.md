# cron — run a command on a schedule
Lesson: cron is the box's alarm clock. It reads small text files and runs a command whenever the time matches.
System-wide jobs are one file each in `/etc/cron.d/`. A line has five time fields, the user to run as, the command:
    * * * * * root /opt/hello/say.sh
    │ │ │ │ │ └── run as this user
    │ │ │ │ └──── day of week
    │ │ │ └────── month
    │ │ └──────── day of month
    │ └────────── hour
    └──────────── minute          * means "every" — five stars = every minute
Cron is running on the box. Two things bite: the shell turns a bare `*` into file names (shell track, wildcards), so
put the whole line in single quotes when you echo it; and the script must be executable (`chmod +x`).
Try it:
    wg shell
    ls /etc/cron.d
    cat /opt/hello/say.sh              it writes the time into /var/lib/hello/last
Your task: create the file `/etc/cron.d/hello` with exactly one line that runs `/opt/hello/say.sh` every minute as `root`.
Bonus: wait a minute, then `cat /var/lib/hello/last` — cron ran it for you.
Where: on the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
