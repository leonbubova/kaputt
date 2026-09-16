## 1
`systemctl start NAME` starts a stopped service. Check with `systemctl status NAME` — the `Active:` line must say `active (running)`.
## 2
The name is still `wg-clock`: `systemctl start wg-clock`. Then `cat /opt/wg/clock/now` twice, a few seconds apart — the time moves.
## 3
    systemctl start wg-clock
    systemctl status wg-clock
