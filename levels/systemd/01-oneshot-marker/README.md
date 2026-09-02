# a unit file tells systemd what to run: write one, reload, start it
Lesson: systemd does not run commands you type — it runs units. A unit is a small text file in `/etc/systemd/system/<name>.service` that declares what to start and how. You write the declaration, systemd does the running.
Two sections are enough for a first unit: `[Unit]` with a `Description=`, and `[Service]` with `Type=` and `ExecStart=`. `ExecStart=` needs an absolute path to a program — there is no shell, no PATH, no `cd`. A shell one-liner therefore goes through `/bin/sh -c '...'`.
`Type=oneshot` is for jobs that run to completion: systemd starts the command, waits for it to exit, and the job is done. No daemon, no loop.
systemd reads unit files only when told to. After every edit: `systemctl daemon-reload` — otherwise it keeps the old (or no) version in memory.
    [Service]  Type=oneshot  ExecStart=/abs/path     the two lines that define a run-once job
    systemctl daemon-reload                          make systemd re-read /etc/systemd/system
    systemctl start wg-x                             run the unit now
    systemctl status wg-x                            did it run? exit status + last log lines
Try it first: `systemctl cat wg-marker` — nothing loaded yet; compare after your first daemon-reload.
Your task: "On the target host we need a unit `wg-marker.service` that runs once and writes the hostname into `/opt/wg/marker/ran`. No daemon, no loop — run it, it writes, it's done."
Goal: `wg-marker.service` exists in `/etc/systemd/system`, is a oneshot, has been started successfully, and `/opt/wg/marker/ran` contains the hostname.
Check yourself:  wg check      stuck?  wg hint
