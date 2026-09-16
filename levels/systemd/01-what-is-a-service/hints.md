## 1
A service is a background program that systemd keeps running. `systemctl status NAME` shows if it runs; `systemctl stop NAME` stops it.
## 2
The name is `wg-clock`. Inside `wg shell`: `systemctl stop wg-clock`, then `systemctl status wg-clock` to see `inactive (dead)`.
## 3
    systemctl stop wg-clock
    systemctl status wg-clock
