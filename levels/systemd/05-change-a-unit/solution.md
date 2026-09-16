Edit the unit, tell systemd to re-read it, run it again.
    sed -i "s/echo hello >/echo hello again >/" /etc/systemd/system/wg-hello.service
    systemctl daemon-reload && systemctl start wg-hello
