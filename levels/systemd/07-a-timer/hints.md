## 1
A timer is its own unit file, `NAME.timer`, and starts the service of the same name whenever it fires. It needs `daemon-reload` like any new unit file, and it is the timer you start, not the service.
## 2
`nano /etc/systemd/system/wg-tick.timer`, the four lines from the lesson. Then `systemctl daemon-reload`, `systemctl start wg-tick.timer`, `systemctl list-timers --all`.
## 3
    cat > /etc/systemd/system/wg-tick.timer <<'U'
    [Unit]
    Description=run wg-tick every minute
    [Timer]
    OnCalendar=*:*:00
    U
    systemctl daemon-reload
    systemctl start wg-tick.timer
