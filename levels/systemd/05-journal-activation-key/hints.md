## 1
What a service prints does not land in a file or on anyone's terminal — systemd captures its stdout/stderr into the journal, tagged with the unit name, and keeps it after the unit has finished. `systemctl status wg-license` shows only the last few lines.
## 2
`journalctl -u wg-license` shows everything that unit ever logged, oldest first; `-o cat` strips timestamps and leaves the raw lines.
## 3
`journalctl -u wg-license -o cat | sed -n 's/^activation key: //p' | tail -1 > /opt/wg/license/key`
