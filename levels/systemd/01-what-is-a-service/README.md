# what is a service? — systemctl status and stop
Lesson: a Linux box runs many programs in the background that nobody started by hand — the network, ssh, a web
server. The program that starts and watches them is `systemd`. Each background program it manages is a
*service*, and every service has a name. You talk to systemd with one command: `systemctl`.
    systemctl status NAME     is NAME running? since when? what did it print last?
    systemctl stop NAME       stop it now
On this box a small service called `wg-clock` is running: it writes the current time into `/opt/wg/clock/now`
every 2 seconds. Try it — type `wg shell` on your Mac (you land on the Linux box as root), then:
    systemctl status wg-clock
    cat /opt/wg/clock/now
The line `Active: active (running)` means: it runs. Run `cat` again — the time moved.
Your task: stop the `wg-clock` service. Afterwards `systemctl status wg-clock` must say `Active: inactive (dead)`.
Work in `wg shell` (root shell on the box). Every lesson of this track is typed there.
Check yourself:  wg check      stuck?  wg hint
