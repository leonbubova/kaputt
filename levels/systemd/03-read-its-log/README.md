# what did the service print? — journalctl
Lesson: a service has no terminal. Whatever it prints does not appear on any screen — systemd catches every
line and stores it in its log, the *journal*, tagged with the service name. The lines stay there even after
the service has finished. One command reads them:
    journalctl -u NAME        everything NAME ever printed, oldest first (q quits the reader)
`systemctl status NAME` shows only the last few of those lines — `journalctl -u NAME` shows all of them.
A service `wg-greeter` ran once on this box and printed three lines, then finished. Try it:
    systemctl status wg-greeter
    journalctl -u wg-greeter
Your task: one of the printed lines reads `secret word: SOMETHING`. Put that SOMETHING — just the word, nothing
else — into the file `/opt/wg/greeter/word`. Lesson 1 of the shell track showed how: `echo SOMETHING > /opt/wg/greeter/word`.
Work in `wg shell`.
Check yourself:  wg check      stuck?  wg hint
