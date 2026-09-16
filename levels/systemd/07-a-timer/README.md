# run something every minute — a timer
Lesson: systemd has no "run this every minute" line inside a service. Instead there is a second kind of unit,
the *timer*: a file `NAME.timer` next to `NAME.service`. The timer fires, and each time it fires it starts the
service with the same name. So a scheduled job is always two files: the service (what) and the timer (when).
    [Timer]
    OnCalendar=*:*:00         when: every time the seconds hit 00 — once a minute
    systemctl list-timers --all      every timer: NEXT run, LAST run, which service it fires
A oneshot service `wg-tick` already exists: it writes the current time into `/opt/wg/tick/last`. Try it:
    cat /etc/systemd/system/wg-tick.service
    systemctl start wg-tick
    cat /opt/wg/tick/last
Works by hand. Now make it automatic.
Your task: create `/etc/systemd/system/wg-tick.timer` with exactly these four lines, `systemctl daemon-reload`,
then start the timer: `systemctl start wg-tick.timer` (the `.timer` at the end matters — without it you start the service).
    [Unit]
    Description=run wg-tick every minute
    [Timer]
    OnCalendar=*:*:00
`systemctl list-timers --all` then shows `wg-tick.timer` with a NEXT time less than a minute away. `wg check` waits for the first tick.
Work in `wg shell`.
Check yourself:  wg check      stuck?  wg hint
