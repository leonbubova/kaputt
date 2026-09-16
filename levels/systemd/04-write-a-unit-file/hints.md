## 1
A unit file is plain text in `/etc/systemd/system/NAME.service` with a `[Unit]` and a `[Service]` section. systemd only notices new or changed files after `systemctl daemon-reload`.
## 2
`nano /etc/systemd/system/wg-hello.service`, type the five lines from the lesson exactly (square brackets included), save, leave. Then `systemctl daemon-reload` and `systemctl status wg-hello`.
## 3
    cat > /etc/systemd/system/wg-hello.service <<'U'
    [Unit]
    Description=my first unit
    [Service]
    Type=oneshot
    ExecStart=/bin/echo hello from my first unit
    U
    systemctl daemon-reload
