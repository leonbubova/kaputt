# start and restart a service
Lesson: stopping is one order; the other two you need are:
    systemctl start NAME      start it now (nothing happens if it already runs)
    systemctl restart NAME    stop it and start it again — the way to make a service pick up a change
Right now `wg-clock` is stopped. Try it:
    systemctl status wg-clock
    cat /opt/wg/clock/now
`Active: inactive (dead)` — and the time in the file does not move, no matter how often you `cat` it.
Your task: start `wg-clock`. Afterwards `systemctl status wg-clock` says `active (running)` and
`/opt/wg/clock/now` shows a fresh time every 2 seconds.
Work in `wg shell`.
Check yourself:  wg check      stuck?  wg hint
